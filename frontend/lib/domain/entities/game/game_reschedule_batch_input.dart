import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playifs_frontend/domain/entities/game/game_reschedule_item.dart';

part 'game_reschedule_batch_input.freezed.dart';

/// Entidade de input para (PATCH /games/datetime/batch-update).
@freezed
abstract class GameRescheduleBatchInput with _$GameRescheduleBatchInput {
  /// Construtor de fábrica.
  const factory GameRescheduleBatchInput({
    required List<GameRescheduleItem> schedules,
  }) = _GameRescheduleBatchInput;
}