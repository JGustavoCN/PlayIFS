// lib/domain/usecases/athlete/find_athlete_by_id_use_case.dart
import '../../../core/network/result.dart';
import '../../entities/athlete/athlete_details.dart';
import '../../repositories/athlete_repository.dart';

class FindAthleteByIdUseCase {
  FindAthleteByIdUseCase(this._repository);
  final AthleteRepository _repository;

  Future<Result<AthleteDetails>> execute(int id) => _repository.findById(id);
}