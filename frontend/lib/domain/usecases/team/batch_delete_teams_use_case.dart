// lib/domain/usecases/team/batch_delete_teams_use_case.dart
import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/shared/id_batch.dart';
import 'package:playifs_frontend/domain/repositories/team_repository.dart';

class BatchDeleteTeamsUseCase {

  BatchDeleteTeamsUseCase(this._repository);
  final TeamRepository _repository;

  Future<Result<void>> call(IdBatch batch) => _repository.batchDelete(batch);
}