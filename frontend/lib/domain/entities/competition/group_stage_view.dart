import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playifs_frontend/domain/entities/competition/group_standings_report.dart';

part 'group_stage_view.freezed.dart';

/// Represents the complete view of the group stage for a sport in a competition.
@freezed
abstract class GroupStageView with _$GroupStageView {
  /// Default constructor
  const factory GroupStageView({
    required List<GroupStandingsReport> groups,
  }) = _GroupStageView;
}