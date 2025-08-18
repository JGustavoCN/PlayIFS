// Ficheiro: lib/data/repositories/auth_repository_impl.dart

import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/data/datasources/playifs_api_service.dart';
import 'package:playifs_frontend/data/mappers/auth_mappers.dart';
import 'package:playifs_frontend/data/models/auth/refresh_token_request_dto.dart';
import 'package:playifs_frontend/data/repositories/base_repository.dart';
import 'package:playifs_frontend/domain/entities/auth/auth_tokens.dart';
import 'package:playifs_frontend/domain/entities/auth/login_credentials.dart';
import 'package:playifs_frontend/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends BaseRepository implements AuthRepository {
  AuthRepositoryImpl(this._apiService);

  final PlayifsApiService _apiService;

  @override
  Future<Result<AuthTokens>> login(LoginCredentials credentials) =>
      handleApiCall(() async {
        final loginRequestDTO = credentials.toDTO();
        final response = await _apiService.login(loginRequestDTO);
        return response.toEntity();
      });

  @override
  Future<Result<AuthTokens>> refreshToken(String refreshToken) =>
      handleApiCall(() async {
        final requestDTO = RefreshTokenRequestDTO(refreshToken: refreshToken);
        final response = await _apiService.refreshToken(requestDTO);
        return response.toEntity();
      });
}