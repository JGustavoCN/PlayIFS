import '../../../core/network/result.dart';
import '../../entities/auth/auth_tokens.dart';
import '../../repositories/auth_repository.dart';

/// Caso de Uso para a funcionalidade de renovação de token.
class RefreshTokenUseCase {
  /// Constrói o caso de uso com uma dependência do contrato [AuthRepository].
  // REGRA DE ESTILO 1: O construtor vem ANTES das declarações de variáveis.
  RefreshTokenUseCase(this._repository);

  /// A dependência é a abstração do repositório.
  final AuthRepository _repository;

  /// Executa a operação de renovação do token.
  Future<Result<AuthTokens>> execute(String refreshToken) =>
      // REGRA DE ESTILO 2: Usando a sintaxe de seta (=>) para um retorno único.
  _repository.refreshToken(refreshToken);
}