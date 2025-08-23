// Ficheiro: lib/data/repositories/designated_coach_repository_impl.dart

import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/data/datasources/playifs_api_service.dart';
import 'package:playifs_frontend/data/mappers/designated_coach_mappers.dart';
import 'package:playifs_frontend/data/mappers/page_mappers.dart';
import 'package:playifs_frontend/data/models/shared/id_batch_dto.dart';
import 'package:playifs_frontend/data/repositories/base_repository.dart';
import 'package:playifs_frontend/domain/entities/designated_coach/designated_coach_details.dart';
import 'package:playifs_frontend/domain/entities/designated_coach/designated_coach_input.dart';
import 'package:playifs_frontend/domain/entities/designated_coach/designated_coach_input_batch.dart';
import 'package:playifs_frontend/domain/entities/designated_coach/designated_coach_summary.dart';
import 'package:playifs_frontend/domain/entities/designated_coach/remove_coach_input.dart';
import 'package:playifs_frontend/domain/entities/shared/page.dart';
import 'package:playifs_frontend/domain/repositories/designated_coach_repository.dart';

class DesignatedCoachRepositoryImpl extends BaseRepository
    implements DesignatedCoachRepository {
  DesignatedCoachRepositoryImpl(this._apiService);
  final PlayifsApiService _apiService;

  @override
  Future<Result<Page<DesignatedCoachSummary>>> findAll({
    int page = 0, int size = 10, String? sort, Map<String, dynamic>? filters,
  }) {
    final queries = {'page': page, 'size': size, 'sort': sort, ...?filters}
      ..removeWhere((key, value) => value == null);
    return handleApiCall(() async {
      final response = await _apiService.findAllDesignatedCoaches(queries);
      return response.data.toEntity<DesignatedCoachSummary>((dto) => dto.toEntity());
    });
  }

  @override
  Future<Result<DesignatedCoachDetails>> findById(int id) =>
      handleApiCall(() async {
        final response = await _apiService.findDesignatedCoachById(id);
        return response.data.toEntity();
      });

  @override
  Future<Result<DesignatedCoachDetails>> defineCoach(DesignatedCoachInput input) =>
      handleApiCall(() async {
        final response = await _apiService.defineCoach(input.toDTO());
        return response.data.toEntity();
      });

  @override
  Future<Result<DesignatedCoachDetails>> updateCoach(DesignatedCoachInput input) =>
      handleApiCall(() async {
        final response = await _apiService.updateCoach(input.toDTO());
        return response.data.toEntity();
      });

  @override
  Future<Result<List<DesignatedCoachDetails>>> batchUpsert(
      DesignatedCoachInputBatch batch) => handleApiCall(() async {
    final response = await _apiService.batchUpsertCoaches(batch.toDTO());
    return response.data.map((dto) => dto.toEntity()).toList();
  });

  @override
  Future<Result<void>> removeCoach(RemoveCoachInput input) =>
      handleApiCall(() => _apiService.removeCoach(input.toQueries()));

  @override
  Future<Result<void>> batchRemove(List<int> ids) => handleApiCall(() {
    final batchDto = IdBatchDTO(ids: ids);
    return _apiService.batchRemoveCoaches(batchDto);
  });
}