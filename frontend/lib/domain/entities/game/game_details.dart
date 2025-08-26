import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playifs_frontend/domain/entities/game/game_phase.dart';
import 'package:playifs_frontend/domain/entities/team/team_summary.dart';

part 'game_details.freezed.dart';

/// Represents the detailed information of a game.
@freezed
abstract class GameDetails with _$GameDetails {
  /// Default constructor
  const factory GameDetails({
    required int id,
    TeamSummary? teamA,
    TeamSummary? teamB,
    int? scoreTeamA,
    int? scoreTeamB,
    required DateTime? dateTime,
    required String status,
    required GamePhase phase,
    String? location,
    int? teamAId,
    int? teamBId,
    String? nextGameAs, // 'TEAM_A' or 'TEAM_B'
    int? nextGameId,
  }) = _GameDetails;
}