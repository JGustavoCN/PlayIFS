// Ficheiro: lib/domain/usecases/competition/delete_competition_use_case.dart
import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/repositories/competition_repository.dart';

class DeleteCompetitionUseCase {
  const DeleteCompetitionUseCase(this._repository);
  final CompetitionRepository _repository;

  Future<Result<void>> execute(int id) => _repository.delete(id);
}