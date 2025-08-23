// Ficheiro: lib/data/repositories/competition_repository_impl.dart

import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/data/datasources/playifs_api_service.dart';
import 'package:playifs_frontend/data/mappers/competition_mappers.dart';
import 'package:playifs_frontend/data/mappers/page_mappers.dart';
import 'package:playifs_frontend/data/models/shared/id_batch_dto.dart';
import 'package:playifs_frontend/data/repositories/base_repository.dart';
import 'package:playifs_frontend/domain/entities/competition/competition_details.dart';
import 'package:playifs_frontend/domain/entities/competition/competition_input.dart';
import 'package:playifs_frontend/domain/entities/competition/competition_summary.dart';
import 'package:playifs_frontend/domain/entities/shared/page.dart';
import 'package:playifs_frontend/domain/repositories/competition_repository.dart';

class CompetitionRepositoryImpl extends BaseRepository
    implements CompetitionRepository {
  CompetitionRepositoryImpl(this._apiService);
  final PlayifsApiService _apiService;

  @override
  Future<Result<Page<CompetitionSummary>>> findAll({
    int page = 0,
    int size = 10,
    String? sort,
    Map<String, dynamic>? filters,
  }) {
    final queries = {'page': page, 'size': size, 'sort': sort, ...?filters};
    queries.removeWhere((key, value) => value == null);

    return handleApiCall(() async {
      final response = await _apiService.findAllCompetitions(queries);
      return response.data.toEntity<CompetitionSummary>((dto) => dto.toEntity());
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
        final response = await _apiService.insertCompetition(competition.toDTO());
        return response.data.toEntity();
      });

  @override
  Future<Result<CompetitionDetails>> update(int id, CompetitionInput competition) =>
      handleApiCall(() async {
        final response = await _apiService.updateCompetition(id, competition.toDTO());
        return response.data.toEntity();
      });

  @override
  Future<Result<void>> delete(int id) =>
      handleApiCall(() => _apiService.deleteCompetition(id));

  @override
  Future<Result<void>> batchDelete(List<int> ids) => handleApiCall(() {
    final batchDto = IdBatchDTO(ids: ids);
    return _apiService.batchDeleteCompetitions(batchDto);
  });
}