// lib/domain/usecases/team/insert_team_use_case.dart
import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/team/team_details.dart';
import 'package:playifs_frontend/domain/entities/team/team_input.dart';
import 'package:playifs_frontend/domain/repositories/team_repository.dart';

class InsertTeamUseCase {

  InsertTeamUseCase(this._repository);
  final TeamRepository _repository;

  Future<Result<TeamDetails>> call(TeamInput teamInput) =>
      _repository.insert(teamInput);
}