import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/game/game_details.dart';
import 'package:playifs_frontend/domain/entities/game/game_result_input.dart';
import 'package:playifs_frontend/domain/repositories/game_repository.dart';

class UpdateGameResultUseCase {
  UpdateGameResultUseCase(this._repository);
  final GameRepository _repository;

  Future<Result<GameDetails>> execute(int gameId, GameResultInput input) => _repository.updateResult(gameId, input);
}