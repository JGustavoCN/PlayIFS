import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playifs_frontend/domain/entities/competition/team_standing.dart';

part 'group_standings_report.freezed.dart';

/// Represents the full standings report for a single group.
@freezed
abstract class GroupStandingsReport with _$GroupStandingsReport {
  /// Default constructor
  const factory GroupStandingsReport({
    required int groupId,
    required String groupName,
    required List<TeamStanding> standings,
  }) = _GroupStandingsReport;
}