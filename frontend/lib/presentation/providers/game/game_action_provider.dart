import 'package:playifs_frontend/core/di/locator.dart';
import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/game/game_reschedule_batch_input.dart';
import 'package:playifs_frontend/domain/entities/game/game_result_batch_input.dart';
import 'package:playifs_frontend/domain/entities/game/game_result_input.dart';
import 'package:playifs_frontend/domain/entities/game/game_update_input.dart';
import 'package:playifs_frontend/domain/entities/game/game_wo_input.dart';
import 'package:playifs_frontend/domain/entities/shared/id_batch.dart';
import 'package:playifs_frontend/domain/usecases/game/batch_delete_games_use_case.dart';
import 'package:playifs_frontend/domain/usecases/game/batch_reschedule_games_use_case.dart';
import 'package:playifs_frontend/domain/usecases/game/batch_update_results_use_case.dart';
import 'package:playifs_frontend/domain/usecases/game/delete_game_use_case.dart';
import 'package:playifs_frontend/domain/usecases/game/register_wo_use_case.dart';
import 'package:playifs_frontend/domain/usecases/game/reschedule_game_use_case.dart';
import 'package:playifs_frontend/domain/usecases/game/undo_wo_use_case.dart';
import 'package:playifs_frontend/domain/usecases/game/update_game_result_use_case.dart';
import 'package:playifs_frontend/presentation/providers/game/game_action_state.dart';
import 'package:playifs_frontend/presentation/providers/game/game_details_provider.dart';
import 'package:playifs_frontend/presentation/providers/game/games_list_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game_action_provider.g.dart';

@riverpod
class GameActionNotifier extends _$GameActionNotifier {
  late final RescheduleGameUseCase _rescheduleUseCase;
  late final DeleteGameUseCase _deleteUseCase;
  late final BatchDeleteGamesUseCase _batchDeleteUseCase;
  late final UpdateGameResultUseCase _updateResultUseCase;
  late final BatchUpdateResultsUseCase _batchUpdateResultsUseCase;
  late final RegisterWoUseCase _registerWoUseCase;
  late final UndoWoUseCase _undoWoUseCase;
  late final BatchRescheduleGamesUseCase _batchRescheduleUseCase;

  @override
  GameActionState build() {
    _rescheduleUseCase = locator<RescheduleGameUseCase>();
    _deleteUseCase = locator<DeleteGameUseCase>();
    _batchDeleteUseCase = locator<BatchDeleteGamesUseCase>();
    _updateResultUseCase = locator<UpdateGameResultUseCase>();
    _batchUpdateResultsUseCase = locator<BatchUpdateResultsUseCase>();
    _registerWoUseCase = locator<RegisterWoUseCase>();
    _undoWoUseCase = locator<UndoWoUseCase>();
    _batchRescheduleUseCase = locator<BatchRescheduleGamesUseCase>();
    return const GameActionState.initial();
  }

  void reset() => state = const GameActionState.initial();

  Future<void> _invalidateDependencies(int gameId) async {
    ref.invalidate(gameDetailsNotifierProvider(gameId));
    ref.invalidate(gamesListNotifierProvider);
  }

  Future<void> reschedule(int gameId, GameUpdateInput input) async {
    state = const GameActionState.loading();
    final result = await _rescheduleUseCase.execute(gameId, input);
    state = result.when(
      success: (game) {
        _invalidateDependencies(gameId);
        return GameActionState.success(game);
      },
      failure: (error) => GameActionState.failure(error),
    );
  }

  Future<void> delete(int gameId) async {
    state = const GameActionState.loading();
    final result = await _deleteUseCase.execute(gameId);
    state = result.when(
      success: (_) {
        ref.invalidate(gamesListNotifierProvider);
        return const GameActionState.deleteSuccess();
      },
      failure: (error) => GameActionState.failure(error),
    );
  }

  Future<void> batchDelete(IdBatch ids) async {
    state = const GameActionState.loading();
    final result = await _batchDeleteUseCase.execute(ids);
    state = result.when(
      success: (_) {
        ref.invalidate(gamesListNotifierProvider);
        return const GameActionState.deleteSuccess();
      },
      failure: (error) => GameActionState.failure(error),
    );
  }

  Future<void> updateResult(int gameId, GameResultInput input) async {
    state = const GameActionState.loading();
    final result = await _updateResultUseCase.execute(gameId, input);
    state = result.when(
      success: (game) {
        _invalidateDependencies(gameId);
        return GameActionState.success(game);
      },
      failure: (error) => GameActionState.failure(error),
    );
  }

  Future<void> batchUpdateResults(GameResultBatchInput input) async {
    state = const GameActionState.loading();
    final result = await _batchUpdateResultsUseCase.execute(input);
    state = result.when(
      success: (games) {
        ref.invalidate(gamesListNotifierProvider);
        for (final game in games) {
          ref.invalidate(gameDetailsNotifierProvider(game.id));
        }
        return const GameActionState.initial();
      },
      failure: (error) => GameActionState.failure(error),
    );
  }

  Future<void> registerWo(int gameId, GameWoInput input) async {
    state = const GameActionState.loading();
    final result = await _registerWoUseCase.execute(gameId, input);
    state = result.when(
      success: (game) {
        _invalidateDependencies(gameId);
        return GameActionState.success(game);
      },
      failure: (error) => GameActionState.failure(error),
    );
  }

  Future<void> undoWo(int gameId) async {
    state = const GameActionState.loading();
    final result = await _undoWoUseCase.execute(gameId);
    state = result.when(
      success: (game) {
        _invalidateDependencies(gameId);
        return GameActionState.success(game);
      },
      failure: (error) => GameActionState.failure(error),
    );
  }

  Future<void> batchReschedule(GameRescheduleBatchInput input) async {
    state = const GameActionState.loading();
    final result = await _batchRescheduleUseCase.execute(input);
    state = result.when(
      success: (games) {
        ref.invalidate(gamesListNotifierProvider);
        for (final game in games) {
          ref.invalidate(gameDetailsNotifierProvider(game.id));
        }
        return const GameActionState.initial();
      },
      failure: (error) => GameActionState.failure(error),
    );
  }
}