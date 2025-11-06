import 'package:playifs_frontend/core/network/result.dart'; import 'package:playifs_frontend/domain/entities/game/game_details.dart'; import 'package:playifs_frontend/domain/entities/game/game_reschedule_batch_input.dart'; import 'package:playifs_frontend/domain/entities/game/game_result_batch_input.dart'; import 'package:playifs_frontend/domain/entities/game/game_result_input.dart'; import 'package:playifs_frontend/domain/entities/game/game_summary.dart'; import 'package:playifs_frontend/domain/entities/game/game_update_input.dart'; import 'package:playifs_frontend/domain/entities/game/game_wo_input.dart'; import 'package:playifs_frontend/domain/entities/shared/id_batch.dart'; import 'package:playifs_frontend/domain/entities/shared/page.dart';

abstract interface class GameRepository {

  Future<Result<GameDetails>> findById(int gameId);

  Future<Result<Page<GameSummary>>> findAll({ required int page, int? teamId, int? competitionId, int? sportId, String? status, String? phase, });

  Future<Result<GameDetails>> reschedule(int gameId, GameUpdateInput input);

  Future<Result<void>> delete(int gameId);

  Future<Result<void>> batchDelete(IdBatch ids);

  Future<Result<GameDetails>> updateResult(int gameId, GameResultInput input);

  Future<Result<List<GameDetails>>> batchUpdateResults( GameResultBatchInput input, );

  Future<Result<GameDetails>> registerWo(int gameId, GameWoInput input);

  Future<Result<GameDetails>> undoWo(int gameId);

  Future<Result<List<GameDetails>>> batchReschedule( GameRescheduleBatchInput input, );
}