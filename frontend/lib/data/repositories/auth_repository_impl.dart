// Ficheiro: lib/data/repositories/auth_repository_impl.dart

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

// 1. ADICIONAR O IMPORT NECESSÁRIO para a nossa exceção customizada.
import 'package:playifs_frontend/core/network/exceptions.dart';

import '../../core/network/result.dart';
import '../../domain/entities/auth/auth_tokens.dart';
import '../../domain/entities/auth/login_credentials.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/playifs_api_service.dart';
import '../mappers/auth_mappers.dart';
import '../models/auth/refresh_token_request_dto.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._apiService);
  final PlayifsApiService _apiService;

  @override
  Future<Result<AuthTokens>> login(LoginCredentials credentials) async {
    try {
      final loginRequestDTO = credentials.toDTO();
      final responseDTO = await _apiService.login(loginRequestDTO);
      final authTokens = responseDTO.toEntity();
      return Result.success(authTokens);
    } on DioException catch (e) {
      debugPrint('[AuthRepositoryImpl] DioException apanhada. Verificando tipo...');

      // 2. CORREÇÃO: Adicionamos a verificação para a ValidationException.
      // Esta é a lógica que faltava no seu ficheiro.
      if (e.error is ValidationException) {
        debugPrint('[AuthRepositoryImpl] -> Erro de validação 422 identificado.');
        // A mensagem aqui pode ser genérica, pois a UI mostrará os erros dos campos.
        return Result.failure('Dados inválidos. Verifique os campos.', error: e);
      }

      // A verificação para outros erros de autenticação permanece.
      if (e.response?.statusCode == 401 || e.response?.statusCode == 403) {
        debugPrint('[AuthRepositoryImpl] -> Erro 401/403 identificado.');
        return Result.failure('Matrícula ou senha inválida.', error: e);
      }

      // O erro de rede genérico é o nosso fallback final.
      debugPrint('[AuthRepositoryImpl] -> Erro de rede genérico.');
      return Result.failure('Ocorreu um erro de rede. Tente novamente.', error: e);
    }
  }

  @override
  Future<Result<AuthTokens>> refreshToken(String refreshToken) async {
    try {
      final requestDTO = RefreshTokenRequestDTO(refreshToken: refreshToken);
      final responseDTO = await _apiService.refreshToken(requestDTO);
      final authTokens = responseDTO.toEntity();
      return Result.success(authTokens);
    } on DioException catch (e) {
      return Result.failure('Sessão expirada. Por favor, faça login novamente.', error: e);
    }
  }
}