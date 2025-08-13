// Ficheiro: lib/core/network/dio_client.dart

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../data/models/shared/api_validation_error.dart';
import '../../domain/entities/auth/auth_tokens.dart';
import '../constants/api_constants.dart';
import 'exceptions.dart';

class DioClient {

  DioClient(this.dio, this.secureStorage) {
    dio.options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      contentType: 'application/json',
      responseType: ResponseType.json,
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          debugPrint('[DioClient] -> Request: ${options.method} ${options.uri}');
          final tokensJsonString = await secureStorage.read(key: 'auth_tokens');
          if (tokensJsonString != null) {
            try {
              final authTokens = AuthTokens.fromJson(jsonDecode(tokensJsonString));
              options.headers['Authorization'] = 'Bearer ${authTokens.accessToken}';
              debugPrint('[DioClient] -> Token adicionado ao cabeçalho.');
            } catch (e) {
              debugPrint('[DioClient] -> Erro ao fazer parse do token guardado: $e');
            }
          } else {
            debugPrint('[DioClient] -> Nenhum token encontrado para adicionar ao cabeçalho.');
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          debugPrint('[DioClient] <- Response [${response.statusCode}]: ${response.data}');
          return handler.next(response);
        },
        onError: (error, handler) async {
          debugPrint('[DioClient] <- Error [${error.response?.statusCode}]: ${error.message}');

          // --- LÓGICA DE ERROS DE VALIDAÇÃO (422) ---
          // Esta verificação agora tem prioridade para tratar os erros de formulário.
          if (error.response?.statusCode == 422) {
            debugPrint('[DioClient] -> Erro 422 detetado. A processar erros de validação.');
            final validationErrorData = error.response?.data;
            if (validationErrorData is Map<String, dynamic>) {
              try {
                final validationError = ApiValidationError.fromJson(validationErrorData);
                // "Enriquecemos" a DioException com a nossa ValidationException customizada.
                final customError = DioException(
                  requestOptions: error.requestOptions,
                  error: ValidationException(validationError),
                );
                // Rejeitamos com o nosso erro customizado, que será apanhado pelo repositório.
                return handler.reject(customError);
              } catch (e) {
                debugPrint('[DioClient] -> Falha ao fazer parse do erro de validação 422.');
              }
            }
          }

          // --- LÓGICA DE RENOVAÇÃO DE TOKEN (401) ---
          if (error.response?.statusCode == 401) {
            final tokensJsonString = await secureStorage.read(key: 'auth_tokens');

            if (tokensJsonString != null) {
              final authTokens = AuthTokens.fromJson(jsonDecode(tokensJsonString));
              final refreshToken = authTokens.refreshToken;

              try {
                final refreshDio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
                final refreshResponse = await refreshDio.post(
                  ApiConstants.authRefreshToken,
                  data: {'refreshToken': refreshToken},
                );
                final newTokens = AuthTokens.fromJson(refreshResponse.data);

                await secureStorage.write(key: 'auth_tokens', value: jsonEncode(newTokens.toJson()));
                error.requestOptions.headers['Authorization'] = 'Bearer ${newTokens.accessToken}';

                final response = await dio.fetch(error.requestOptions);
                return handler.resolve(response);
              } on DioException {
                await secureStorage.deleteAll();
                return handler.reject(error);
              }
            } else {
              return handler.reject(error);
            }
          }

          // Para todos os outros erros não tratados, apenas propaga.
          debugPrint('[DioClient] -> O erro não pôde ser tratado. A propagar.');
          return handler.next(error);
        },
      ),
    );
  }
  final Dio dio;
  final FlutterSecureStorage secureStorage;
}