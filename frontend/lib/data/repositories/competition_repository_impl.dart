import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/data/datasources/playifs_api_service.dart';
import 'package:playifs_frontend/data/mappers/competition_mappers.dart';
import 'package:playifs_frontend/data/mappers/competition_stage_mappers.dart';
import 'package:playifs_frontend/data/mappers/game_mappers.dart';
import 'package:playifs_frontend/data/mappers/id_batch_mappers.dart';
import 'package:playifs_frontend/data/mappers/page_mappers.dart';
import 'package:playifs_frontend/data/repositories/base_repository.dart';
import 'package:playifs_frontend/domain/entities/competition/competition_details.dart';
import 'package:playifs_frontend/domain/entities/competition/competition_input.dart';
import 'package:playifs_frontend/domain/entities/competition/competition_summary.dart';
import 'package:playifs_frontend/domain/entities/competition/elimination_bracket.dart';
import 'package:playifs_frontend/domain/entities/competition/group_stage_view.dart';
import 'package:playifs_frontend/domain/entities/game/game_details.dart';
import 'package:playifs_frontend/domain/entities/shared/id_batch.dart';
import 'package:playifs_frontend/domain/entities/shared/page.dart';
import 'package:playifs_frontend/domain/repositories/competition_repository.dart';

/// Concrete implementation of the CompetitionRepository contract.
class CompetitionRepositoryImpl extends BaseRepository
    implements CompetitionRepository {

  /// Default constructor.
  CompetitionRepositoryImpl(this._apiService);
  /// The API service for making network requests.
  final PlayifsApiService _apiService;

  @override
  Future<Result<Page<CompetitionSummary>>> findAll({
    int page = 0,
    int size = 10,
    String? sort,
    String? name, // CORRIGIDO: Parâmetro explícito
    String? level, // CORRIGIDO: Parâmetro explícito
  }) {
    // Lógica para construir o mapa de queries a partir dos parâmetros nomeados.
    final queries = <String, dynamic>{
      'page': page,
      'size': size,
      'sort': sort,
      'name': name,
      'level': level,
    };
    // Remove chaves nulas antes de enviar para a API.
    queries.removeWhere((key, value) => value == null);

    return handleApiCall(() async {
      final response = await _apiService.findAllCompetitions(queries);
      // O mapeamento de DTO para Entidade permanece o mesmo.
      return response.data.toEntity((dto) => dto.toEntity());
    });
  }

  @override
  Future<Result<CompetitionDetails>> findById(int id) => handleApiCall(() async {
    final response = await _apiService.findCompetitionById(id);
    return response.data.toEntity();
  });

  @override
  Future<Result<CompetitionDetails>> insert(CompetitionInput competition) =>
      handleApiCall(() async {
        final response =
        await _apiService.insertCompetition(competition.toDTO());
        return response.data.toEntity();
      });

  @override
  Future<Result<CompetitionDetails>> update(int id, CompetitionInput competition) =>
      handleApiCall(() async {
        final response =
        await _apiService.updateCompetition(id, competition.toDTO());
        return response.data.toEntity();
      });

  @override
  Future<Result<void>> delete(int id) =>
      handleApiCall(() => _apiService.deleteCompetition(id));

  @override
  Future<Result<void>> batchDelete(IdBatch ids) => handleApiCall(() { // CORRIGIDO: Recebe a entidade IdBatch
    // Usa um mapeador para converter a entidade IdBatch para IdBatchDTO
    final batchDto = ids.toDTO();
    return _apiService.batchDeleteCompetitions(batchDto);
  });

  // --- NOVAS IMPLEMENTAÇÕES ADICIONADAS ---

  @override
  Future<Result<List<GameDetails>>> generateGroupStage({
    required int competitionId,
    required int sportId,
  }) => handleApiCall(() async {
      final response =
      await _apiService.generateGroupStage(competitionId, sportId);
      return response.data.map((dto) => dto.toEntity()).toList();
    });

  @override
  Future<Result<List<GameDetails>>> generateEliminationStage({
    required int competitionId,
    required int sportId,
  }) => handleApiCall(() async {
      final response =
      await _apiService.generateEliminationStage(competitionId, sportId);
      return response.data.map((dto) => dto.toEntity()).toList();
    });

  @override
  Future<Result<GroupStageView>> getGroupStageView({
    required int competitionId,
    required int sportId,
  }) => handleApiCall(() async {
      final response = await _apiService.getGroupStage(competitionId, sportId);
      return response.data.toEntity();
    });

  @override
  Future<Result<EliminationBracket>> getEliminationBracket({
    required int competitionId,
    required int sportId,
  }) => handleApiCall(() async {
      final response =
      await _apiService.getEliminationBracket(competitionId, sportId);
      return response.data.toEntity();
    });
}