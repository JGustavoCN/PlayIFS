import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/competition/elimination_bracket.dart';
import 'package:playifs_frontend/domain/repositories/competition_repository.dart';

/// Use case for fetching the elimination bracket of a competition.
class GetEliminationBracketUseCase {

  /// Default constructor.
  GetEliminationBracketUseCase(this._repository);
  /// The competition repository.
  final CompetitionRepository _repository;

  /// Executes the use case.
  Future<Result<EliminationBracket>> execute({
    required int competitionId,
    required int sportId,
  }) async =>
      _repository.getEliminationBracket(
        competitionId: competitionId,
        sportId: sportId,
      );
}