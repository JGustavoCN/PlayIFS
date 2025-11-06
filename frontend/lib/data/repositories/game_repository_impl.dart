import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/data/datasources/playifs_api_service.dart';
import 'package:playifs_frontend/data/mappers/game_mappers.dart';
import 'package:playifs_frontend/data/mappers/id_batch_mappers.dart';
import 'package:playifs_frontend/data/mappers/page_mappers.dart';
import 'package:playifs_frontend/data/mappers/team_mappers.dart';
import 'package:playifs_frontend/data/models/game/game_details_dto.dart';
import 'package:playifs_frontend/data/repositories/base_repository.dart';
import 'package:playifs_frontend/domain/entities/game/game_details.dart';
import 'package:playifs_frontend/domain/entities/game/game_reschedule_batch_input.dart';
import 'package:playifs_frontend/domain/entities/game/game_result_batch_input.dart';
import 'package:playifs_frontend/domain/entities/game/game_result_input.dart';
import 'package:playifs_frontend/domain/entities/game/game_summary.dart';
import 'package:playifs_frontend/domain/entities/game/game_update_input.dart';
import 'package:playifs_frontend/domain/entities/game/game_wo_input.dart';
import 'package:playifs_frontend/domain/entities/shared/id_batch.dart';
import 'package:playifs_frontend/domain/entities/shared/page.dart';
import 'package:playifs_frontend/domain/repositories/game_repository.dart';

class GameRepositoryImpl extends BaseRepository implements GameRepository {
  GameRepositoryImpl(this._apiService);
  final PlayifsApiService _apiService;

  @override
  Future<Result<GameDetails>> findById(int gameId) => handleApiCall(() async {
    final response = await _apiService.findGameById(gameId);
    return response.data.toEntity();
  });

  @override
  Future<Result<Page<GameSummary>>> findAll({
    required int page,
    int? teamId,
    int? competitionId,
    int? sportId,
    String? status,
    String? phase,
  }) =>
      handleApiCall(() async {
        final response = await _apiService.findAllGames(
          page,
          teamId,
          competitionId,
          sportId,
          status,
          phase,
        );
        return response.data.toEntity((dto) => dto.toEntity());
      });

  @override
  Future<Result<GameDetails>> reschedule(int gameId, GameUpdateInput input) =>
      handleApiCall(() async {
        final response = await _apiService.rescheduleGame(gameId, input.toDto());
        return response.data.toEntity();
      });

  @override
  Future<Result<void>> delete(int gameId) =>
      handleApiCall(() => _apiService.deleteGame(gameId));

  @override
  Future<Result<void>> batchDelete(IdBatch ids) =>
      handleApiCall(() => _apiService.batchDeleteGames(ids.toDTO()));

  @override
  Future<Result<GameDetails>> updateResult(int gameId, GameResultInput input) =>
      handleApiCall(() async {
        final response = await _apiService.updateResult(gameId, input.toDto());
        return response.data.toEntity();
      });

  @override
  Future<Result<List<GameDetails>>> batchUpdateResults(
      GameResultBatchInput input,
      ) =>
      handleApiCall(() async {
        final response = await _apiService.batchUpdateResults(input.toDto());
        return response.data.map((dto) => dto.toEntity()).toList();
      });

  @override
  Future<Result<GameDetails>> registerWo(int gameId, GameWoInput input) =>
      handleApiCall(() async {
        final response = await _apiService.registerWo(gameId, input.toDto());
        return response.data.toEntity();
      });

  @override
  Future<Result<GameDetails>> undoWo(int gameId) => handleApiCall(() async {
    final response = await _apiService.undoWo(gameId);
    return response.data.toEntity();
  });

  @override
  Future<Result<List<GameDetails>>> batchReschedule(
      GameRescheduleBatchInput input,
      ) =>
      handleApiCall(() async {
        final response = await _apiService.batchReschedule(input.toDto());
        return response.data.map((dto) => dto.toEntity()).toList();
      });
}