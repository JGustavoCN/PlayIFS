// lib/domain/usecases/athlete/batch_delete_athletes_use_case.dart
import '../../../core/network/result.dart';
import '../../repositories/athlete_repository.dart';

class BatchDeleteAthletesUseCase {
  BatchDeleteAthletesUseCase(this._repository);
  final AthleteRepository _repository;

  Future<Result<void>> execute(List<int> ids) => _repository.batchDelete(ids);
}