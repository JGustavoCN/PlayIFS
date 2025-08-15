// lib/domain/usecases/athlete/batch_insert_athletes_use_case.dart
import '../../../core/network/result.dart';
import '../../entities/athlete/athlete_details.dart';
import '../../entities/athlete/athlete_input.dart';
import '../../repositories/athlete_repository.dart';

class BatchInsertAthletesUseCase {
  BatchInsertAthletesUseCase(this._repository);
  final AthleteRepository _repository;

  Future<Result<List<AthleteDetails>>> execute(List<AthleteInput> athletes) =>
      _repository.batchInsert(athletes);
}