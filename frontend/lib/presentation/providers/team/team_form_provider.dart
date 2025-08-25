import 'dart:async';

import 'package:playifs_frontend/core/di/locator.dart';
import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/team/team_details.dart';
import 'package:playifs_frontend/domain/entities/team/team_input.dart';
import 'package:playifs_frontend/domain/entities/team/team_update.dart';
import 'package:playifs_frontend/domain/usecases/team/insert_team_use_case.dart';
import 'package:playifs_frontend/domain/usecases/team/update_team_use_case.dart';
import 'package:playifs_frontend/presentation/providers/team/team_details_provider.dart';
import 'package:playifs_frontend/presentation/providers/team/teams_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// ✅ CORREÇÃO: Import de 'team_form_state.dart' removido pois não é mais usado aqui.

part 'team_form_provider.g.dart';

@riverpod
class TeamFormNotifier extends _$TeamFormNotifier {
  final InsertTeamUseCase _insertTeamUseCase = locator<InsertTeamUseCase>();
  final UpdateTeamUseCase _updateTeamUseCase = locator<UpdateTeamUseCase>();

  @override
  AsyncValue<void> build({TeamDetails? initialTeam}) {
    return const AsyncData(null);
  }

  Future<void> submit({
    required String teamName,
    TeamDetails? initialTeam,
    int? competitionId,
    int? sportId,
    int? courseId,
    required int coachId,
    required List<int> athleteIds,
  }) async {
    state = const AsyncLoading();

    final isEditing = initialTeam != null;

    final result = isEditing
        ? await _update(initialTeam.id, teamName)
        : await _create(competitionId!, sportId!, courseId!, coachId, teamName, athleteIds);

    state = result.when(
      success: (_) {
        ref.invalidate(teamsNotifierProvider);
        if (isEditing) {
          ref.invalidate(teamDetailsNotifierProvider(initialTeam.id));
        }
        return const AsyncData(null);
      },
      failure: (error) => AsyncError(error, StackTrace.current),
    );
  }

  Future<Result<dynamic>> _create(
      int compId, int sportId, int courseId, int coachId, String name, List<int> athleteIds,
      ) {
    final teamInput = TeamInput(
      name: name.trim(),
      competitionId: compId,
      sportId: sportId,
      courseId: courseId,
      coachId: coachId,
      athleteIds: athleteIds,
    );
    return _insertTeamUseCase(teamInput);
  }

  Future<Result<dynamic>> _update(int teamId, String name) {
    final teamUpdate = TeamUpdate(name: name.trim());
    return _updateTeamUseCase(id: teamId, teamUpdate: teamUpdate);
  }
}