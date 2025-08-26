import 'package:playifs_frontend/data/mappers/team_mappers.dart';
import 'package:playifs_frontend/data/models/game/game_details_dto.dart';
import 'package:playifs_frontend/domain/entities/game/game_details.dart';

/// Extension to map GameDetailsDTO to GameDetails entity.
extension GameDetailsDTOToEntity on GameDetailsDTO {
  /// Converts DTO to entity.
  GameDetails toEntity() => GameDetails(
    id: id,
    teamA: teamA?.toEntity(),
    teamB: teamB?.toEntity(),
    scoreTeamA: scoreTeamA,
    scoreTeamB: scoreTeamB,
    dateTime: dateTime,
    status: status,
    phase: phase,
    location: location,
    teamAId: teamAId,
    teamBId: teamBId,
    nextGameAs: nextGameAs,
    nextGameId: nextGameId,
  );
}