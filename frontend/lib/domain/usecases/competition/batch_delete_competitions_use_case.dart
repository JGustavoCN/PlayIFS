// Ficheiro: lib/domain/usecases/competition/batch_delete_competitions_use_case.dart
import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/repositories/competition_repository.dart';

class BatchDeleteCompetitionsUseCase {
  const BatchDeleteCompetitionsUseCase(this._repository);
  final CompetitionRepository _repository;

  Future<Result<void>> execute(List<int> ids) => _repository.batchDelete(ids);
}