import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_result_dto.freezed.dart';
part 'game_result_dto.g.dart';

@freezed
abstract class GameResultDTO with _$GameResultDTO {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.none)
  const factory GameResultDTO({
    required int scoreTeamA,
    required int scoreTeamB,
  }) = _GameResultDTO;

  factory GameResultDTO.fromJson(Map<String, dynamic> json) =>
      _$GameResultDTOFromJson(json);
}