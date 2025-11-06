import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playifs_frontend/data/models/team/team_summary_dto.dart';

part 'game_details_dto.freezed.dart';
part 'game_details_dto.g.dart';

@freezed
abstract class GameDetailsDTO with _$GameDetailsDTO {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.none)
  const factory GameDetailsDTO({
    required int id,
    String? dateTime,
    required String status,
    required String phase,
    TeamSummaryDTO? teamA,
    TeamSummaryDTO? teamB,
    int? scoreTeamA,
    int? scoreTeamB,
    String? createdAt,
    String? updatedAt,
  }) = _GameDetailsDTO;

  factory GameDetailsDTO.fromJson(Map<String, dynamic> json) =>
      _$GameDetailsDTOFromJson(json);
}