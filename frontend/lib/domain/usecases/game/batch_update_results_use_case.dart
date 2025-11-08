import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/game/game_details.dart';
import 'package:playifs_frontend/domain/entities/game/game_result_batch_input.dart';
import 'package:playifs_frontend/domain/repositories/game_repository.dart';

class BatchUpdateResultsUseCase {
  BatchUpdateResultsUseCase(this._repository);
  final GameRepository _repository;

  Future<Result<List<GameDetails>>> execute(GameResultBatchInput input) => _repository.batchUpdateResults(input);
}