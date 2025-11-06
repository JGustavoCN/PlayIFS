import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/game/game_summary.dart';
import 'package:playifs_frontend/domain/entities/shared/page.dart';
import 'package:playifs_frontend/domain/repositories/game_repository.dart';

class FindAllGamesUseCase {
  FindAllGamesUseCase(this._repository);
  final GameRepository _repository;

  Future<Result<Page<GameSummary>>> execute({
    required int page,
    int? teamId,
    int? competitionId,
    int? sportId,
    String? status,
    String? phase,
  }) {
    return _repository.findAll(
      page: page,
      teamId: teamId,
      competitionId: competitionId,
      sportId: sportId,
      status: status,
      phase: phase,
    );
  }
}