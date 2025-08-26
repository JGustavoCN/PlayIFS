// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GameDetailsDTO _$GameDetailsDTOFromJson(Map<String, dynamic> json) =>
    _GameDetailsDTO(
      id: (json['id'] as num).toInt(),
      teamA: json['teamA'] == null
          ? null
          : TeamSummaryDTO.fromJson(json['teamA'] as Map<String, dynamic>),
      teamB: json['teamB'] == null
          ? null
          : TeamSummaryDTO.fromJson(json['teamB'] as Map<String, dynamic>),
      scoreTeamA: (json['scoreTeamA'] as num?)?.toInt(),
      scoreTeamB: (json['scoreTeamB'] as num?)?.toInt(),
      dateTime: json['dateTime'] == null
          ? null
          : DateTime.parse(json['dateTime'] as String),
      status: json['status'] as String,
      phase: $enumDecode(_$GamePhaseEnumMap, json['phase']),
      location: json['location'] as String?,
      teamAId: (json['teamAId'] as num?)?.toInt(),
      teamBId: (json['teamBId'] as num?)?.toInt(),
      nextGameAs: json['nextGameAs'] as String?,
      nextGameId: (json['nextGameId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GameDetailsDTOToJson(_GameDetailsDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'teamA': instance.teamA,
      'teamB': instance.teamB,
      'scoreTeamA': instance.scoreTeamA,
      'scoreTeamB': instance.scoreTeamB,
      'dateTime': instance.dateTime?.toIso8601String(),
      'status': instance.status,
      'phase': _$GamePhaseEnumMap[instance.phase]!,
      'location': instance.location,
      'teamAId': instance.teamAId,
      'teamBId': instance.teamBId,
      'nextGameAs': instance.nextGameAs,
      'nextGameId': instance.nextGameId,
    };

const _$GamePhaseEnumMap = {
  GamePhase.GROUP_STAGE: 'GROUP_STAGE',
  GamePhase.ROUND_OF_16: 'ROUND_OF_16',
  GamePhase.QUARTER_FINALS: 'QUARTER_FINALS',
  GamePhase.SEMI_FINALS: 'SEMI_FINALS',
  GamePhase.THIRD_PLACE_DISPUTE: 'THIRD_PLACE_DISPUTE',
  GamePhase.FINAL: 'FINAL',
};
