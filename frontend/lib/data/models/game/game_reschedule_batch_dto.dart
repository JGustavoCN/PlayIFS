import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playifs_frontend/data/models/game/game_reschedule_item_dto.dart';

part 'game_reschedule_batch_dto.freezed.dart';
part 'game_reschedule_batch_dto.g.dart';

@freezed
abstract class GameRescheduleBatchDTO with _$GameRescheduleBatchDTO {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.none)
  const factory GameRescheduleBatchDTO({
    required List<GameRescheduleItemDTO> schedules,
  }) = _GameRescheduleBatchDTO;

  factory GameRescheduleBatchDTO.fromJson(Map<String, dynamic> json) =>
      _$GameRescheduleBatchDTOFromJson(json);
}