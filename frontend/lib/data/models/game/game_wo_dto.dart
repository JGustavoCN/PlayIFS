import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_wo_dto.freezed.dart';
part 'game_wo_dto.g.dart';

@freezed
abstract class GameWoDTO with _$GameWoDTO {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.none)
  const factory GameWoDTO({
    required int winnerTeamId,
  }) = _GameWoDTO;

  factory GameWoDTO.fromJson(Map<String, dynamic> json) =>
      _$GameWoDTOFromJson(json);
}