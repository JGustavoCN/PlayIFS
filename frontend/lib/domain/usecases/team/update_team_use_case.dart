// lib/domain/usecases/team/update_team_use_case.dart
import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/team/team_details.dart';
import 'package:playifs_frontend/domain/entities/team/team_update.dart';
import 'package:playifs_frontend/domain/repositories/team_repository.dart';

class UpdateTeamUseCase {

  UpdateTeamUseCase(this._repository);
  final TeamRepository _repository;

  Future<Result<TeamDetails>> call({
    required int id,
    required TeamUpdate teamUpdate,
  }) =>
      _repository.update(id, teamUpdate);
}