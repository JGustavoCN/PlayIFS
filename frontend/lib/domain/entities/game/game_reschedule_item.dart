import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_reschedule_item.freezed.dart';

@freezed
abstract class GameRescheduleItem with _$GameRescheduleItem {
  const factory GameRescheduleItem({
    required int gameId,
    required DateTime dateTime,
  }) = _GameRescheduleItem;
}