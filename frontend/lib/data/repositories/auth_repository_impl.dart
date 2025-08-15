import 'package:dio/dio.dart';
import 'package:playifs_frontend/core/network/exceptions.dart';
import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/data/datasources/playifs_api_service.dart';
import 'package:playifs_frontend/data/mappers/auth_mappers.dart';
import 'package:playifs_frontend/data/models/auth/refresh_token_request_dto.dart';
import 'package:playifs_frontend/domain/entities/auth/auth_tokens.dart';
import 'package:playifs_frontend/domain/entities/auth/login_credentials.dart';
import 'package:playifs_frontend/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._apiService);

  final PlayifsApiService _apiService;

  @override
  Future<Result<AuthTokens>> login(LoginCredentials credentials) =>
      _handleApiCall<AuthTokens>(() async {
        final loginRequestDTO = credentials.toDTO();
        final responseDTO = await _apiService.login(loginRequestDTO);
        return responseDTO.toEntity();
      });

  @override
  Future<Result<AuthTokens>> refreshToken(String refreshToken) =>
      _handleApiCall<AuthTokens>(() async {
        final requestDTO = RefreshTokenRequestDTO(refreshToken: refreshToken);
        final responseDTO = await _apiService.refreshToken(requestDTO);
        return responseDTO.toEntity();
      });

  Future<Result<T>> _handleApiCall<T>(Future<T> Function() apiCall) async {
    try {
      return Result.success(await apiCall());
    } on DioException catch (e) {
      if (e.error is ValidationException) {
        return Result.failure(e.error as ValidationException);
      }

      if (e.response?.statusCode == 401 || e.response?.statusCode == 403) {
        return Result.failure(ApiException(
          'Matrícula ou senha inválida.',
          statusCode: e.response?.statusCode,
        ));
      }

      final message = e.response?.data?['error'] ?? e.message ?? 'Erro desconhecido';
      return Result.failure(ApiException(
        message,
        statusCode: e.response?.statusCode,
      ));
    } catch (e) {
      return Result.failure(ApiException(e.toString()));
    }
  }
}