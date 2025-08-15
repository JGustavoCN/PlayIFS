// lib/domain/usecases/athlete/delete_athlete_use_case.dart
import '../../../core/network/result.dart';
import '../../repositories/athlete_repository.dart';

class DeleteAthleteUseCase {
  DeleteAthleteUseCase(this._repository);
  final AthleteRepository _repository;

  Future<Result<void>> execute(int id) => _repository.delete(id);
}