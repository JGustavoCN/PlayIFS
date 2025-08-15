// lib/domain/usecases/athlete/insert_athlete_use_case.dart
import '../../../core/network/result.dart';
import '../../entities/athlete/athlete_details.dart';
import '../../entities/athlete/athlete_input.dart';
import '../../repositories/athlete_repository.dart';

class InsertAthleteUseCase {
  InsertAthleteUseCase(this._repository);
  final AthleteRepository _repository;

  Future<Result<AthleteDetails>> execute(AthleteInput athleteInput) =>
      _repository.insert(athleteInput);
}