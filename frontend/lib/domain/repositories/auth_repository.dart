import '../entities/auth/auth_tokens.dart';
import '../entities/auth/login_credentials.dart';
import '../../core/network/result.dart'; // Assumindo que temos um tipo Result definido

/// O Contrato (Abstração) do Repositório de Autenticação.
///
/// Define as operações de dados relacionadas à autenticação que a aplicação pode realizar,
/// abstraindo os detalhes de implementação da fonte de dados (ex: API REST).
abstract class AuthRepository {

  /// Tenta autenticar um utilizador com as credenciais fornecidas.
  ///
  /// Retorna um [Future] que completa com um [Result]:
  /// - Em caso de sucesso, contém [AuthTokens].
  /// - Em caso de falha, contém um [Failure].
  Future<Result<AuthTokens>> login(LoginCredentials credentials);

  /// Tenta renovar o token de acesso usando um refresh token.
  ///
  /// Retorna um [Future] que completa com um [Result]:
  /// - Em caso de sucesso, contém um novo par de [AuthTokens].
  /// - Em caso de falha, contém um [Failure].
  Future<Result<AuthTokens>> refreshToken(String refreshToken);
}