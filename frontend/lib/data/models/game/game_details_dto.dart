import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playifs_frontend/data/models/team/team_summary_dto.dart';
import 'package:playifs_frontend/domain/entities/game/game_phase.dart';

part 'game_details_dto.freezed.dart';
part 'game_details_dto.g.dart';

/// Represents the detailed information of a game from the API.
@freezed
abstract class GameDetailsDTO with _$GameDetailsDTO {
  /// Default constructor
  const factory GameDetailsDTO({
    required int id,
    TeamSummaryDTO? teamA,
    TeamSummaryDTO? teamB,
    int? scoreTeamA,
    int? scoreTeamB,
    required DateTime? dateTime,
    required String status,
    required GamePhase phase,
    String? location,
    int? teamAId,
    int? teamBId,
    String? nextGameAs,
    int? nextGameId,
  }) = _GameDetailsDTO;

  /// Factory constructor for creating a new DTO instance from a map.
  factory GameDetailsDTO.fromJson(Map<String, dynamic> json) =>
      _$GameDetailsDTOFromJson(json);
}