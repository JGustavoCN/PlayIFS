import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/competition/group_stage_view.dart';
import 'package:playifs_frontend/domain/repositories/competition_repository.dart';

/// Use case for fetching the group stage view of a competition.
class GetGroupStageViewUseCase {
  /// The competition repository.
  final CompetitionRepository _repository;

  /// Default constructor.
  GetGroupStageViewUseCase(this._repository);

  /// Executes the use case.
  Future<Result<GroupStageView>> execute({
    required int competitionId,
    required int sportId,
  }) async =>
      _repository.getGroupStageView(
        competitionId: competitionId,
        sportId: sportId,
      );
}