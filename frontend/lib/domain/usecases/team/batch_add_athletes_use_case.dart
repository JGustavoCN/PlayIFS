// lib/domain/usecases/team/batch_add_athletes_use_case.dart
import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/shared/id_batch.dart';
import 'package:playifs_frontend/domain/entities/team/team_details.dart';
import 'package:playifs_frontend/domain/repositories/team_repository.dart';

class BatchAddAthletesUseCase {

  BatchAddAthletesUseCase(this._repository);
  final TeamRepository _repository;

  Future<Result<TeamDetails>> call({
    required int teamId,
    required IdBatch batch,
  }) =>
      _repository.batchAddAthletes(teamId, batch);
}