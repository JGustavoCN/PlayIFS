// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GameDetailsDTO _$GameDetailsDTOFromJson(Map<String, dynamic> json) =>
    _GameDetailsDTO(
      id: (json['id'] as num).toInt(),
      dateTime: json['dateTime'] as String?,
      status: json['status'] as String,
      phase: json['phase'] as String,
      teamA: json['teamA'] == null
          ? null
          : TeamSummaryDTO.fromJson(json['teamA'] as Map<String, dynamic>),
      teamB: json['teamB'] == null
          ? null
          : TeamSummaryDTO.fromJson(json['teamB'] as Map<String, dynamic>),
      scoreTeamA: (json['scoreTeamA'] as num?)?.toInt(),
      scoreTeamB: (json['scoreTeamB'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$GameDetailsDTOToJson(_GameDetailsDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dateTime': instance.dateTime,
      'status': instance.status,
      'phase': instance.phase,
      'teamA': instance.teamA?.toJson(),
      'teamB': instance.teamB?.toJson(),
      'scoreTeamA': instance.scoreTeamA,
      'scoreTeamB': instance.scoreTeamB,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
