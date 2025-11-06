import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playifs_frontend/domain/entities/game/game_result_item.dart';

part 'game_result_batch_input.freezed.dart';

/// Entidade de input para (PATCH /games/results/batch-update).
@freezed
abstract class GameResultBatchInput with _$GameResultBatchInput {
  /// Construtor de fábrica.
  const factory GameResultBatchInput({
    required List<GameResultItem> results,
  }) = _GameResultBatchInput;
}