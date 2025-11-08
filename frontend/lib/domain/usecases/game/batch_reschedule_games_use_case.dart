import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/game/game_details.dart';
import 'package:playifs_frontend/domain/entities/game/game_reschedule_batch_input.dart';
import 'package:playifs_frontend/domain/repositories/game_repository.dart';

class BatchRescheduleGamesUseCase {
  BatchRescheduleGamesUseCase(this._repository);
  final GameRepository _repository;

  Future<Result<List<GameDetails>>> execute(GameRescheduleBatchInput input) => _repository.batchReschedule(input);
}