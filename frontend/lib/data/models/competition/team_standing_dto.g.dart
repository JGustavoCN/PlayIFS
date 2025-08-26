// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_standing_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TeamStandingDTO _$TeamStandingDTOFromJson(Map<String, dynamic> json) =>
    _TeamStandingDTO(
      teamId: (json['teamId'] as num).toInt(),
      teamName: json['teamName'] as String,
      points: (json['points'] as num).toInt(),
      wins: (json['wins'] as num).toInt(),
      goalsFor: (json['goalsFor'] as num).toInt(),
      goalsAgainst: (json['goalsAgainst'] as num).toInt(),
      goalDifference: (json['goalDifference'] as num).toInt(),
      gamesPlayed: (json['gamesPlayed'] as num?)?.toInt(),
      draws: (json['draws'] as num?)?.toInt(),
      losses: (json['losses'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TeamStandingDTOToJson(_TeamStandingDTO instance) =>
    <String, dynamic>{
      'teamId': instance.teamId,
      'teamName': instance.teamName,
      'points': instance.points,
      'wins': instance.wins,
      'goalsFor': instance.goalsFor,
      'goalsAgainst': instance.goalsAgainst,
      'goalDifference': instance.goalDifference,
      'gamesPlayed': instance.gamesPlayed,
      'draws': instance.draws,
      'losses': instance.losses,
    };
