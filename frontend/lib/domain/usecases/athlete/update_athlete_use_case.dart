// lib/domain/usecases/athlete/update_athlete_use_case.dart
import '../../../core/network/result.dart';
import '../../entities/athlete/athlete_details.dart';
import '../../entities/athlete/athlete_update.dart';
import '../../repositories/athlete_repository.dart';

class UpdateAthleteUseCase {
  UpdateAthleteUseCase(this._repository);
  final AthleteRepository _repository;

  Future<Result<AthleteDetails>> execute(int id, AthleteUpdate athleteUpdate) =>
      _repository.update(id, athleteUpdate);
}