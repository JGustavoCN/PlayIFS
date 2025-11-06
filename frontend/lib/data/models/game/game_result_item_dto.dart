import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_result_item_dto.freezed.dart';
part 'game_result_item_dto.g.dart';

@freezed
abstract class GameResultItemDTO with _$GameResultItemDTO {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.none)
  const factory GameResultItemDTO({
    required int gameId,
    required int scoreTeamA,
    required int scoreTeamB,
  }) = _GameResultItemDTO;

  factory GameResultItemDTO.fromJson(Map<String, dynamic> json) =>
      _$GameResultItemDTOFromJson(json);
}