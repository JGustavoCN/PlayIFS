import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/game/game_details.dart';
import 'package:playifs_frontend/domain/entities/game/game_update_input.dart';
import 'package:playifs_frontend/domain/repositories/game_repository.dart';

class RescheduleGameUseCase {
  RescheduleGameUseCase(this._repository);
  final GameRepository _repository;

  Future<Result<GameDetails>> execute(int gameId, GameUpdateInput input) => _repository.reschedule(gameId, input);
}