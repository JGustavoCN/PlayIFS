// Ficheiro: lib/domain/usecases/designated_coach/batch_remove_coaches_use_case.dart
import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/repositories/designated_coach_repository.dart';

class BatchRemoveCoachesUseCase {
  const BatchRemoveCoachesUseCase(this._repository);
  final DesignatedCoachRepository _repository;

  Future<Result<void>> execute(List<int> ids) => _repository.batchRemove(ids);
}