import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/game/game_details.dart';
import 'package:playifs_frontend/domain/repositories/competition_repository.dart';

/// Use case for generating the elimination stage of a competition.
class GenerateEliminationStageUseCase {

  /// Default constructor.
  GenerateEliminationStageUseCase(this._repository);
  /// The competition repository.
  final CompetitionRepository _repository;

  /// Executes the use case.
  Future<Result<List<GameDetails>>> execute({
    required int competitionId,
    required int sportId,
  }) async =>
      _repository.generateEliminationStage(
        competitionId: competitionId,
        sportId: sportId,
      );
}