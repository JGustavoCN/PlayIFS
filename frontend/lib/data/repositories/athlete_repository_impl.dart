// Ficheiro: lib/data/repositories/athlete_repository_impl.dart

import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/data/datasources/playifs_api_service.dart';
import 'package:playifs_frontend/data/mappers/athlete_mappers.dart';
import 'package:playifs_frontend/data/mappers/page_mappers.dart';
import 'package:playifs_frontend/data/models/athlete/athlete_input_batch_dto.dart';
import 'package:playifs_frontend/data/models/shared/id_batch_dto.dart';
import 'package:playifs_frontend/data/repositories/base_repository.dart';
import 'package:playifs_frontend/domain/entities/athlete/athlete_details.dart';
import 'package:playifs_frontend/domain/entities/athlete/athlete_input.dart';
import 'package:playifs_frontend/domain/entities/athlete/athlete_summary.dart';
import 'package:playifs_frontend/domain/entities/athlete/athlete_update.dart';
import 'package:playifs_frontend/domain/entities/shared/page.dart';
import 'package:playifs_frontend/domain/repositories/athlete_repository.dart';

class AthleteRepositoryImpl extends BaseRepository implements AthleteRepository {
  AthleteRepositoryImpl(this._apiService);

  final PlayifsApiService _apiService;

  @override
  Future<Result<Page<AthleteSummary>>> findAll({
    int page = 0,
    int size = 10,
    String? name,
  }) {
    final queries = {'page': page, 'size': size, 'name': name};
    queries.removeWhere((key, value) => value == null);

    return handleApiCall(() async {
      final response = await _apiService.findAllAthletes(queries);
      // ✅ CORREÇÃO: Usando a nova sintaxe explícita do mapeador.
      return response.data.toEntity<AthleteSummary>((dto) => dto.toEntity());
    });
  }

  @override
  Future<Result<AthleteDetails>> findById(int id) => handleApiCall(() async {
    final response = await _apiService.findAthleteById(id);
    return response.data.toEntity();
  });

  @override
  Future<Result<AthleteDetails>> insert(AthleteInput athleteInput) =>
      handleApiCall(() async {
        final response = await _apiService.insertAthlete(athleteInput.toDTO());
        return response.data.toEntity();
      });

  @override
  Future<Result<List<AthleteDetails>>> batchInsert(List<AthleteInput> athletes) =>
      handleApiCall(() async {
        final batchDTO =
        AthleteInputBatchDTO(athletes: athletes.map((e) => e.toDTO()).toList());
        final response = await _apiService.batchInsertAthletes(batchDTO);
        return response.data.map((dto) => dto.toEntity()).toList();
      });

  @override
  Future<Result<AthleteDetails>> update(int id, AthleteUpdate athleteUpdate) =>
      handleApiCall(() async {
        final response =
        await _apiService.updateAthlete(id, athleteUpdate.toDTO());
        return response.data.toEntity();
      });

  @override
  Future<Result<void>> delete(int id) =>
      handleApiCall(() => _apiService.deleteAthlete(id));

  @override
  Future<Result<void>> batchDelete(List<int> ids) => handleApiCall(() {
    final batchDTO = IdBatchDTO(ids: ids);
    return _apiService.batchDeleteAthletes(batchDTO);
  });
}