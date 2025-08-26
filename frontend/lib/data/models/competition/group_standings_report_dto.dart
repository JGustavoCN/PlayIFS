import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playifs_frontend/data/models/competition/team_standing_dto.dart';

part 'group_standings_report_dto.freezed.dart';
part 'group_standings_report_dto.g.dart';

/// Represents the full standings report for a single group from the API.
@freezed
abstract class GroupStandingsReportDTO with _$GroupStandingsReportDTO {
  /// Default constructor
  const factory GroupStandingsReportDTO({
    // Java Long maps to int in Dart/JSON
    required int groupId,
    required String groupName,
    required List<TeamStandingDTO> standings,
  }) = _GroupStandingsReportDTO;

  /// Factory constructor for creating a new DTO instance from a map.
  factory GroupStandingsReportDTO.fromJson(Map<String, dynamic> json) =>
      _$GroupStandingsReportDTOFromJson(json);
}