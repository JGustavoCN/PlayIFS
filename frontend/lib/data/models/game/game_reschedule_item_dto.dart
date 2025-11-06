import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_reschedule_item_dto.freezed.dart';
part 'game_reschedule_item_dto.g.dart';

@freezed
abstract class GameRescheduleItemDTO with _$GameRescheduleItemDTO {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.none)
  const factory GameRescheduleItemDTO({
    required int gameId,
    required String dateTime,
  }) = _GameRescheduleItemDTO;

  factory GameRescheduleItemDTO.fromJson(Map<String, dynamic> json) =>
      _$GameRescheduleItemDTOFromJson(json);
}