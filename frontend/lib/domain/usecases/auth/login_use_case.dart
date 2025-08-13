// Imports devem vir de 'core', 'domain' ou pacotes externos. Nunca de 'data' ou 'presentation'.
import '../../../core/network/result.dart';
import '../../entities/auth/auth_tokens.dart';
import '../../entities/auth/login_credentials.dart';
import '../../repositories/auth_repository.dart';

/// Caso de Uso para a funcionalidade de login.
/// Encapsula a lógica de negócio para autenticar um utilizador.
// Regra 1: A classe tem a única responsabilidade de fazer o login.
class LoginUseCase {
  /// Constrói o caso de uso com uma dependência do contrato [AuthRepository].
  // Regra de Estilo 1: Construtor declarado antes dos campos.
  LoginUseCase(this._repository);

  /// Regra 3: A dependência é a abstração do repositório, não a implementação.
  final AuthRepository _repository;

  /// Regra 4: Expõe um único método 'execute' para realizar a ação.
  /// Recebe uma Entidade de Domínio e retorna um Result com outra Entidade de Domínio.
  Future<Result<AuthTokens>> execute(LoginCredentials credentials) =>
      // Regra de Estilo 2: Usa a sintaxe de seta (=>) para um retorno único e conciso.
  _repository.login(credentials);
}