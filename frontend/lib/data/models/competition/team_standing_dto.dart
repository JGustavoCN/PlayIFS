import 'package:freezed_annotation/freezed_annotation.dart';

part 'team_standing_dto.freezed.dart';
part 'team_standing_dto.g.dart';

@freezed
abstract class TeamStandingDTO with _$TeamStandingDTO {
  const factory TeamStandingDTO({
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
  }) = _TeamStandingDTO;

  factory TeamStandingDTO.fromJson(Map<String, dynamic> json) =>
      _$TeamStandingDTOFromJson(json);
}