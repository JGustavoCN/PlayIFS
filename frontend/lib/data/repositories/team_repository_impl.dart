// lib/data/repositories/team_repository_impl.dart
import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/data/datasources/playifs_api_service.dart';
import 'package:playifs_frontend/data/mappers/id_batch_mappers.dart';
import 'package:playifs_frontend/data/mappers/page_mappers.dart';
import 'package:playifs_frontend/data/mappers/team_mappers.dart';
import 'package:playifs_frontend/data/repositories/base_repository.dart';
import 'package:playifs_frontend/domain/entities/shared/id_batch.dart';
import 'package:playifs_frontend/domain/entities/shared/page.dart';
import 'package:playifs_frontend/domain/entities/team/team_details.dart';
import 'package:playifs_frontend/domain/entities/team/team_input.dart';
import 'package:playifs_frontend/domain/entities/team/team_summary.dart';
import 'package:playifs_frontend/domain/entities/team/team_update.dart';
import 'package:playifs_frontend/domain/repositories/team_repository.dart';

class TeamRepositoryImpl extends BaseRepository implements TeamRepository {
  TeamRepositoryImpl(this._apiService);
  final PlayifsApiService _apiService;

  @override
  Future<Result<Page<TeamSummary>>> findAll({
    int page = 0,
    int size = 10,
    String? sort,
    Map<String, dynamic>? filters,
  }) => handleApiCall(() async {
      final queries = {'page': page, 'size': size, if (sort != null) 'sort': sort, ...?filters}
        ..removeWhere((key, value) => value == null);

      final response = await _apiService.findAllTeams(queries);
      return response.data.toEntity<TeamSummary>((dto) => dto.toEntity());
    });

  @override
  Future<Result<TeamDetails>> findById(int id) => handleApiCall(() async {
    final response = await _apiService.findTeamById(id);
    return response.data.toEntity();
  });

  @override
  Future<Result<TeamDetails>> insert(TeamInput teamInput) =>
      handleApiCall(() async {
        final response = await _apiService.insertTeam(teamInput.toDTO());
        return response.data.toEntity();
      });

  @override
  Future<Result<TeamDetails>> update(int id, TeamUpdate teamUpdate) =>
      handleApiCall(() async {
        final response = await _apiService.updateTeam(id, teamUpdate.toDTO());
        return response.data.toEntity();
      });

  @override
  Future<Result<void>> delete(int id) =>
      handleApiCall(() => _apiService.deleteTeam(id));

  @override
  Future<Result<void>> removeAthlete(int teamId, int athleteId) =>
      handleApiCall(() => _apiService.removeAthlete(teamId, athleteId));

  @override
  Future<Result<void>> batchDelete(IdBatch batch) =>
      handleApiCall(() => _apiService.batchDeleteTeams(batch.toDTO()));

  @override
  Future<Result<TeamDetails>> batchAddAthletes(int teamId, IdBatch batch) =>
      handleApiCall(() async {
        final response =
        await _apiService.batchAddAthletes(teamId, batch.toDTO());
        return response.data.toEntity();
      });

  @override
  Future<Result<void>> batchRemoveAthletes(int teamId, IdBatch batch) =>
      handleApiCall(() => _apiService.batchRemoveAthletes(teamId, batch.toDTO()));
}