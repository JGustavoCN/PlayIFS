// lib/domain/usecases/team/remove_athlete_from_team_use_case.dart
import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/repositories/team_repository.dart';

class RemoveAthleteFromTeamUseCase {

  RemoveAthleteFromTeamUseCase(this._repository);
  final TeamRepository _repository;

  Future<Result<void>> call({
    required int teamId,
    required int athleteId,
  }) =>
      _repository.removeAthlete(teamId, athleteId);
}