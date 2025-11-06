import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playifs_frontend/domain/entities/game/game_phase.dart';
import 'package:playifs_frontend/domain/entities/game/game_status.dart';
import 'package:playifs_frontend/domain/entities/team/team_summary.dart';

part 'game_details.freezed.dart';

@freezed
abstract class GameDetails with _$GameDetails {
  const factory GameDetails({
    required int id,
    DateTime? dateTime,
    required GameStatus status,
    required GamePhase phase,
    TeamSummary? teamA,
    TeamSummary? teamB,
    int? scoreTeamA,
    int? scoreTeamB,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _GameDetails;
}