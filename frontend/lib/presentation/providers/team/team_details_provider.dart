import 'dart:async';

import 'package:playifs_frontend/core/di/locator.dart';
import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/shared/id_batch.dart';
import 'package:playifs_frontend/domain/entities/team/team_details.dart';
import 'package:playifs_frontend/domain/usecases/team/batch_add_athletes_use_case.dart';
import 'package:playifs_frontend/domain/usecases/team/batch_remove_athletes_use_case.dart';
import 'package:playifs_frontend/domain/usecases/team/delete_team_use_case.dart';
import 'package:playifs_frontend/domain/usecases/team/find_team_by_id_use_case.dart';
import 'package:playifs_frontend/domain/usecases/team/remove_athlete_from_team_use_case.dart';
import 'package:playifs_frontend/presentation/providers/team/teams_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'team_details_provider.g.dart';

@riverpod
class TeamDetailsNotifier extends _$TeamDetailsNotifier {
  final FindTeamByIdUseCase _findTeamByIdUseCase = locator<FindTeamByIdUseCase>();
  final DeleteTeamUseCase _deleteTeamUseCase = locator<DeleteTeamUseCase>();
  final BatchAddAthletesUseCase _batchAddAthletesUseCase = locator<BatchAddAthletesUseCase>();
  final BatchRemoveAthletesUseCase _batchRemoveAthletesUseCase = locator<BatchRemoveAthletesUseCase>();
  final RemoveAthleteFromTeamUseCase _removeAthleteUseCase = locator<RemoveAthleteFromTeamUseCase>();

  @override
  Future<TeamDetails> build(int teamId) async {
    final result = await _findTeamByIdUseCase(teamId);
    return result.when(
      success: (team) => team,
      failure: (error) => throw error,
    );
  }

  Future<void> addAthletes(List<int> athleteIds) async {
    final teamId = state.value?.id;
    if (teamId == null) return;

    final batch = IdBatch(ids: athleteIds);
    final result = await _batchAddAthletesUseCase(teamId: teamId, batch: batch);

    result.when(
      success: (updatedTeam) {
        state = AsyncData(updatedTeam);
        // ✅ CORREÇÃO: Usando o nome gerado corretamente: 'teamsNotifierProvider'.
        ref.invalidate(teamsProvider);
      },
      failure: (error) => state = AsyncError(error, StackTrace.current),
    );
  }

  Future<void> removeAthletes(List<int> athleteIds) async {
    final teamId = state.value?.id;
    if (teamId == null) return;

    final batch = IdBatch(ids: athleteIds);
    final result = await _batchRemoveAthletesUseCase(teamId: teamId, batch: batch);

    result.when(
      success: (_) {
        ref.invalidateSelf();
        // ✅ CORREÇÃO: Usando o nome gerado corretamente: 'teamsNotifierProvider'.
        ref.invalidate(teamsProvider);
      },
      failure: (error) => state = AsyncError(error, StackTrace.current),
    );
  }

  Future<void> deleteTeam() async {
    final teamId = state.value?.id;
    if (teamId == null) return;

    final result = await _deleteTeamUseCase(teamId);

    result.when(
      success: (_) {
        // ✅ CORREÇÃO: Usando o nome gerado corretamente: 'teamsNotifierProvider'.
        ref.invalidate(teamsProvider);
      },
      failure: (error) => state = AsyncError(error, StackTrace.current),
    );
  }

  Future<void> removeSingleAthlete(int athleteId) async {
    final teamId = state.value?.id;
    if (teamId == null) return;

    final result = await _removeAthleteUseCase(teamId: teamId, athleteId: athleteId);

    result.when(
      success: (_) {
        ref.invalidateSelf();
        // ✅ CORREÇÃO: Usando o nome gerado corretamente: 'teamsNotifierProvider'.
        ref.invalidate(teamsProvider);
      },
      failure: (error) => state = AsyncError(error, StackTrace.current),
    );
  }
}