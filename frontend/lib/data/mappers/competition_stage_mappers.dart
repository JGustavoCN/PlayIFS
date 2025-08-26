import 'package:playifs_frontend/data/mappers/game_mappers.dart';
import 'package:playifs_frontend/data/models/competition/elimination_bracket_dto.dart';
import 'package:playifs_frontend/data/models/competition/group_stage_view_dto.dart';
import 'package:playifs_frontend/data/models/competition/group_standings_report_dto.dart';
import 'package:playifs_frontend/data/models/competition/team_standing_dto.dart';
import 'package:playifs_frontend/domain/entities/competition/elimination_bracket.dart';
import 'package:playifs_frontend/domain/entities/competition/group_stage_view.dart';
import 'package:playifs_frontend/domain/entities/competition/group_standings_report.dart';
import 'package:playifs_frontend/domain/entities/competition/team_standing.dart';

/// Extension to map TeamStandingDTO to TeamStanding entity.
extension TeamStandingDTOToEntity on TeamStandingDTO {
  /// Converts DTO to entity.
  TeamStanding toEntity() => TeamStanding(
    teamId: teamId,
    teamName: teamName,
    points: points,
    gamesPlayed: gamesPlayed,
    wins: wins,
    draws: draws,
    losses: losses,
    goalsFor: goalsFor,
    goalsAgainst: goalsAgainst,
    goalDifference: goalDifference,
  );
}

/// Extension to map GroupStandingsReportDTO to GroupStandingsReport entity.
extension GroupStandingsReportDTOToEntity on GroupStandingsReportDTO {
  /// Converts DTO to entity.
  GroupStandingsReport toEntity() => GroupStandingsReport(
    groupId: groupId,
    groupName: groupName,
    standings: standings.map((dto) => dto.toEntity()).toList(),
  );
}

/// Extension to map GroupStageViewDTO to GroupStageView entity.
extension GroupStageViewDTOToEntity on GroupStageViewDTO {
  /// Converts DTO to entity.
  GroupStageView toEntity() => GroupStageView(
    groups: groups.map((dto) => dto.toEntity()).toList(),
  );
}

/// Extension to map EliminationBracketDTO to EliminationBracket entity.
extension EliminationBracketDTOToEntity on EliminationBracketDTO {
  /// Converts DTO to entity.
  EliminationBracket toEntity() => EliminationBracket(
    rounds: rounds.map(
          (key, value) => MapEntry(
        key,
        value.map((gameDto) => gameDto.toEntity()).toList(),
      ),
    ),
  );
}