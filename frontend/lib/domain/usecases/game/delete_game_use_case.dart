import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/repositories/game_repository.dart';

class DeleteGameUseCase {
  DeleteGameUseCase(this._repository);
  final GameRepository _repository;

  Future<Result<void>> execute(int gameId) => _repository.delete(gameId);
}