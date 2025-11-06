import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/game/game_details.dart';
import 'package:playifs_frontend/domain/repositories/game_repository.dart';

class FindGameByIdUseCase {
  FindGameByIdUseCase(this._repository);
  final GameRepository _repository;

  Future<Result<GameDetails>> execute(int gameId) => _repository.findById(gameId);
}