import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playifs_frontend/data/models/competition/group_standings_report_dto.dart';

part 'group_stage_view_dto.freezed.dart';
part 'group_stage_view_dto.g.dart';

/// Represents the group stage view from the API.
@freezed
abstract class GroupStageViewDTO with _$GroupStageViewDTO {
  /// Default constructor
  const factory GroupStageViewDTO({
    required List<GroupStandingsReportDTO> groups,
  }) = _GroupStageViewDTO;

  /// Factory constructor for creating a new DTO instance from a map.
  factory GroupStageViewDTO.fromJson(Map<String, dynamic> json) =>
      _$GroupStageViewDTOFromJson(json);
}