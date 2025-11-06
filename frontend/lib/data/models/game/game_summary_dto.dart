import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_summary_dto.freezed.dart';
part 'game_summary_dto.g.dart';

@freezed
abstract class GameSummaryDTO with _$GameSummaryDTO {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.none)
  const factory GameSummaryDTO({
    required int id,
    String? dateTime,
    required String status,
    required String phase,
    String? teamAName,
    String? teamBName,
    String? createdAt,
    String? updatedAt,
  }) = _GameSummaryDTO;

  factory GameSummaryDTO.fromJson(Map<String, dynamic> json) =>
      _$GameSummaryDTOFromJson(json);
}