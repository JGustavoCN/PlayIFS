import 'package:dio/dio.dart';
import 'package:playifs_frontend/core/network/exceptions.dart';
import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/data/datasources/playifs_api_service.dart';
import 'package:playifs_frontend/data/mappers/athlete_mappers.dart';
import 'package:playifs_frontend/domain/entities/athlete/athlete_details.dart';
import 'package:playifs_frontend/domain/entities/athlete/athlete_input.dart';
import 'package:playifs_frontend/domain/entities/athlete/athlete_summary.dart';
import 'package:playifs_frontend/domain/entities/athlete/athlete_update.dart';
import 'package:playifs_frontend/domain/entities/shared/page.dart';
import 'package:playifs_frontend/domain/repositories/athlete_repository.dart';
import '../models/athlete/athlete_input_batch_dto.dart';
import '../models/shared/id_batch_dto.dart';

class AthleteRepositoryImpl implements AthleteRepository {
  AthleteRepositoryImpl(this._apiService);

  final PlayifsApiService _apiService;

  @override
  Future<Result<Page<AthleteSummary>>> findAll(
      {int page = 0, int size = 10, String? name}) =>
      _handleApiCall<Page<AthleteSummary>>(() async {
        final queries = {'page': page, 'size': size, if (name != null) 'name': name};
        final response = await _apiService.findAllAthletes(queries);
        final pageDto = response.data;
        final content = pageDto.content.map((dto) => dto.toEntity()).toList();
        return Page(
          content: content,
          totalElements: pageDto.totalElements,
          totalPages: pageDto.totalPages,
          number: pageDto.pageNumber,
        );
      });

  @override
  Future<Result<AthleteDetails>> findById(int id) =>
      _handleApiCall<AthleteDetails>(() async {
        final response = await _apiService.findAthleteById(id);
        return response.data.toEntity();
      });

  @override
  Future<Result<AthleteDetails>> insert(AthleteInput athleteInput) =>
      _handleApiCall<AthleteDetails>(() async {
        final response = await _apiService.insertAthlete(athleteInput.toDTO());
        return response.data.toEntity();
      });

  @override
  Future<Result<List<AthleteDetails>>> batchInsert(List<AthleteInput> athletes) =>
      _handleApiCall<List<AthleteDetails>>(() async {
        final batchDTO = AthleteInputBatchDTO(
            athletes: athletes.map((e) => e.toDTO()).toList());
        final response = await _apiService.batchInsertAthletes(batchDTO);
        return response.data.map((dto) => dto.toEntity()).toList();
      });

  @override
  Future<Result<AthleteDetails>> update(int id, AthleteUpdate athleteUpdate) =>
      _handleApiCall<AthleteDetails>(() async {
        final response = await _apiService.updateAthlete(id, athleteUpdate.toDTO());
        return response.data.toEntity();
      });

  @override
  Future<Result<void>> delete(int id) =>
      _handleApiCall<void>(() => _apiService.deleteAthlete(id));

  @override
  Future<Result<void>> batchDelete(List<int> ids) => _handleApiCall<void>(() {
    final batchDTO = IdBatchDTO(ids: ids);
    return _apiService.batchDeleteAthletes(batchDTO);
  });

  Future<Result<T>> _handleApiCall<T>(Future<T> Function() apiCall) async {
    try {
      return Result.success(await apiCall());
    } on DioException catch (e) {
      if (e.error is ValidationException) {
        return Result.failure(e.error as ValidationException);
      }
      final message =
          e.response?.data?['error'] ?? e.message ?? 'Erro desconhecido';
      return Result.failure(ApiException(
        message,
        statusCode: e.response?.statusCode,
      ));
    } catch (e) {
      return Result.failure(ApiException(e.toString()));
    }
  }
}