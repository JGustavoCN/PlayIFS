// Ficheiro: lib/domain/usecases/competition/find_competition_by_id_use_case.dart
import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/competition/competition_details.dart';
import 'package:playifs_frontend/domain/repositories/competition_repository.dart';

class FindCompetitionByIdUseCase {
  const FindCompetitionByIdUseCase(this._repository);
  final CompetitionRepository _repository;

  Future<Result<CompetitionDetails>> execute(int id) => _repository.findById(id);
}