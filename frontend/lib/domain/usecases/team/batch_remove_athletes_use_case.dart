// lib/domain/usecases/team/batch_remove_athletes_use_case.dart
import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/shared/id_batch.dart';
import 'package:playifs_frontend/domain/repositories/team_repository.dart';

class BatchRemoveAthletesUseCase {

  BatchRemoveAthletesUseCase(this._repository);
  final TeamRepository _repository;

  Future<Result<void>> call({
    required int teamId,
    required IdBatch batch,
  }) =>
      _repository.batchRemoveAthletes(teamId, batch);
}