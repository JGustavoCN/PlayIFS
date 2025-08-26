import 'package:freezed_annotation/freezed_annotation.dart';

part 'team_standing.freezed.dart';

@freezed
abstract class TeamStanding with _$TeamStanding {
  const factory TeamStanding({
    required int teamId,
    required String teamName,
    required int points,
    required int wins,
    required int goalsFor,
    required int goalsAgainst,
    required int goalDifference,
    // CORREÇÃO: Campos que podem não vir da API agora são nuláveis.
    int? gamesPlayed,
    int? draws,
    int? losses,
  }) = _TeamStanding;
}