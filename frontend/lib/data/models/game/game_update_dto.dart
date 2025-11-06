import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_update_dto.freezed.dart';
part 'game_update_dto.g.dart';

@freezed
abstract class GameUpdateDTO with _$GameUpdateDTO {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.none)
  const factory GameUpdateDTO({
    required String dateTime,
  }) = _GameUpdateDTO;

  factory GameUpdateDTO.fromJson(Map<String, dynamic> json) =>
      _$GameUpdateDTOFromJson(json);
}