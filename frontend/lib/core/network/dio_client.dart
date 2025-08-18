// Ficheiro: lib/core/network/dio_client.dart

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../data/models/shared/api_validation_error.dart';
import '../../domain/entities/auth/auth_tokens.dart';
import '../constants/api_constants.dart';
import 'exceptions.dart';

class DioClient {

  DioClient(this.dio, this.secureStorage) {
    // 1. Configurações Base do Dio
    dio.options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      contentType: 'application/json',
      responseType: ResponseType.json,
    );

    // 2. Configuração do Cache (ETag)
    final cacheOptions = CacheOptions(
      store: MemCacheStore(),
      policy: CachePolicy.request,
      maxStale: const Duration(days: 7),
    );
    // ✅ CORREÇÃO: Intercetor de cache adicionado PRIMEIRO.
    dio.interceptors.add(DioCacheInterceptor(options: cacheOptions));

    // 3. Configuração do Intercetor de Autenticação e Erros
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          debugPrint('[DioClient] -> Request: ${options.method} ${options.uri}');
          try {
            final tokens = await _getTokens();
            if (tokens != null) {
              options.headers['Authorization'] = 'Bearer ${tokens.accessToken}';
            }
          } catch (e) {
            debugPrint('[DioClient] Erro ao ler tokens: $e');
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          debugPrint('[DioClient] <- Response [${response.statusCode}]');
          debugPrint('[DioClient] <- Headers: ${response.headers}');
          return handler.next(response);
        },
        onError: (error, handler) async {
          debugPrint('[DioClient] <- Error [${error.response?.statusCode}]: ${error.message}');

          if (error.response?.statusCode == 422) {
            return handler.reject(_handleValidationError(error));
          }

          if (error.response?.statusCode == 401) {
            try {
              final response = await _retryRequestWithRefreshedToken(error.requestOptions);
              return handler.resolve(response);
            } on DioException catch (e) {
              await _clearTokens();
              return handler.reject(e);
            }
          }
          return handler.next(error);
        },
      ),
    );
  }
  final Dio dio;
  final FlutterSecureStorage secureStorage;

  // --- Métodos Auxiliares Refatorados ---

  Future<AuthTokens?> _getTokens() async {
    final jsonString = await secureStorage.read(key: 'auth_tokens');
    if (jsonString == null) return null;
    return AuthTokens.fromJson(jsonDecode(jsonString));
  }

  Future<void> _saveTokens(AuthTokens tokens) async {
    await secureStorage.write(key: 'auth_tokens', value: jsonEncode(tokens.toJson()));
  }

  Future<void> _clearTokens() async {
    await secureStorage.delete(key: 'auth_tokens');
  }

  Future<AuthTokens> _refreshToken() async {
    final currentTokens = await _getTokens();
    if (currentTokens == null) throw DioException(requestOptions: RequestOptions(path: ''), error: 'No refresh token available');

    final refreshDio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
    final response = await refreshDio.post(
      ApiConstants.authRefreshToken,
      data: {'refreshToken': currentTokens.refreshToken},
    );
    final newTokens = AuthTokens.fromJson(response.data['data']);
    await _saveTokens(newTokens);
    return newTokens;
  }

  Future<Response> _retryRequestWithRefreshedToken(RequestOptions requestOptions) async {
    final newTokens = await _refreshToken();
    requestOptions.headers['Authorization'] = 'Bearer ${newTokens.accessToken}';
    // Usa a instância principal do 'dio' para repetir a requisição,
    // garantindo que todos os intercetores (incluindo o de cache) sejam aplicados.
    return dio.fetch(requestOptions);
  }

  DioException _handleValidationError(DioException error) {
    final data = error.response?.data;
    if (data is Map<String, dynamic>) {
      try {
        final validationError = ApiValidationError.fromJson(data);
        return DioException(
          requestOptions: error.requestOptions,
          error: ValidationException(validationError),
        );
      } catch (e) {
        // Se o parse falhar, retorna o erro original
      }
    }
    return error;
  }
}