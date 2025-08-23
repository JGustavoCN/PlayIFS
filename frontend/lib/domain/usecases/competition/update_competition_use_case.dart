// Ficheiro: lib/domain/usecases/competition/update_competition_use_case.dart
import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/competition/competition_details.dart';
import 'package:playifs_frontend/domain/entities/competition/competition_input.dart';
import 'package:playifs_frontend/domain/repositories/competition_repository.dart';

class UpdateCompetitionUseCase {
  const UpdateCompetitionUseCase(this._repository);
  final CompetitionRepository _repository;

  Future<Result<CompetitionDetails>> execute(int id, CompetitionInput competition) =>
      _repository.update(id, competition);
}