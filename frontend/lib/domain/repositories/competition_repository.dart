import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/competition/competition_details.dart';
import 'package:playifs_frontend/domain/entities/competition/competition_input.dart';
import 'package:playifs_frontend/domain/entities/competition/competition_summary.dart';
import 'package:playifs_frontend/domain/entities/competition/elimination_bracket.dart';
import 'package:playifs_frontend/domain/entities/competition/group_stage_view.dart';
import 'package:playifs_frontend/domain/entities/game/game_details.dart';
import 'package:playifs_frontend/domain/entities/shared/id_batch.dart';
import 'package:playifs_frontend/domain/entities/shared/page.dart';

/// Abstract contract for competition data operations.
abstract class CompetitionRepository {
  /// Finds all competitions with optional filters and pagination.
  Future<Result<Page<CompetitionSummary>>> findAll({
    int page = 0,
    int size = 10,
    String? sort,
    String? name,
    String? level,
  });

  /// Finds a competition by its ID.
  Future<Result<CompetitionDetails>> findById(int id);

  /// Inserts a new competition.
  Future<Result<CompetitionDetails>> insert(CompetitionInput competition);

  /// Updates an existing competition.
  Future<Result<CompetitionDetails>> update(int id, CompetitionInput competition);

  /// Deletes a competition by its ID.
  Future<Result<void>> delete(int id);

  /// Deletes multiple competitions in a batch.
  Future<Result<void>> batchDelete(IdBatch ids);

  // NOVOS MÉTODOS ADICIONADOS

  /// Generates the group stage games for a specific sport in a competition.
  Future<Result<List<GameDetails>>> generateGroupStage({
    required int competitionId,
    required int sportId,
  });

  /// Generates or advances the elimination stage games.
  Future<Result<List<GameDetails>>> generateEliminationStage({
    required int competitionId,
    required int sportId,
  });

  /// Fetches the complete group stage view with standings.
  Future<Result<GroupStageView>> getGroupStageView({
    required int competitionId,
    required int sportId,
  });

  /// Fetches the elimination bracket view.
  Future<Result<EliminationBracket>> getEliminationBracket({
    required int competitionId,
    required int sportId,
  });
}