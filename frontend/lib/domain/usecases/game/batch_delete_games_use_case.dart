import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/shared/id_batch.dart';
import 'package:playifs_frontend/domain/repositories/game_repository.dart';

class BatchDeleteGamesUseCase {
  BatchDeleteGamesUseCase(this._repository);
  final GameRepository _repository;

  Future<Result<void>> execute(IdBatch ids) => _repository.batchDelete(ids);
}