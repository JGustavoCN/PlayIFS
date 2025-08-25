// lib/domain/repositories/team_repository.dart
import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/shared/id_batch.dart';
import 'package:playifs_frontend/domain/entities/shared/page.dart';
import 'package:playifs_frontend/domain/entities/team/team_details.dart';
import 'package:playifs_frontend/domain/entities/team/team_input.dart';
import 'package:playifs_frontend/domain/entities/team/team_summary.dart';
import 'package:playifs_frontend/domain/entities/team/team_update.dart';

/// Abstract contract for team-related data operations.
abstract class TeamRepository {
  Future<Result<Page<TeamSummary>>> findAll({
    int page = 0,
    int size = 10,
    String? sort,
    Map<String, dynamic>? filters,
  });

  Future<Result<TeamDetails>> findById(int id);
  Future<Result<TeamDetails>> insert(TeamInput teamInput);
  Future<Result<TeamDetails>> update(int id, TeamUpdate teamUpdate);
  Future<Result<void>> delete(int id);
  Future<Result<void>> removeAthlete(int teamId, int athleteId);
  Future<Result<void>> batchDelete(IdBatch batch);
  Future<Result<TeamDetails>> batchAddAthletes(int teamId, IdBatch batch);
  Future<Result<void>> batchRemoveAthletes(int teamId, IdBatch batch);
}