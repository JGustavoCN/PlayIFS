import '../../domain/entities/auth/auth_tokens.dart';
import '../../domain/entities/auth/login_credentials.dart';
import '../models/auth/auth_tokens_dto.dart';
import '../models/auth/login_request_dto.dart';

/// Extension para mapear a entidade de domínio [LoginCredentials]
/// para o DTO [LoginRequestDTO] que será enviado à API.
extension LoginCredentialsToDTO on LoginCredentials {
  LoginRequestDTO toDTO() => LoginRequestDTO(
      registration: registration,
      password: password,
    );
}

/// Extension para mapear o DTO [AuthTokensDTO] recebido da API
/// para a entidade de domínio pura [AuthTokens].
extension AuthTokensDTOToEntity on AuthTokensDTO {
  AuthTokens toEntity() => AuthTokens(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
}