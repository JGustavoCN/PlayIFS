// Ficheiro: lib/domain/usecases/competition/insert_competition_use_case.dart
import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/competition/competition_details.dart';
import 'package:playifs_frontend/domain/entities/competition/competition_input.dart';
import 'package:playifs_frontend/domain/repositories/competition_repository.dart';

class InsertCompetitionUseCase {
  const InsertCompetitionUseCase(this._repository);
  final CompetitionRepository _repository;

  Future<Result<CompetitionDetails>> execute(CompetitionInput competition) =>
      _repository.insert(competition);
}