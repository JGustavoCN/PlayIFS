// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_summary_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GameSummaryDTO _$GameSummaryDTOFromJson(Map<String, dynamic> json) =>
    _GameSummaryDTO(
      id: (json['id'] as num).toInt(),
      dateTime: json['dateTime'] as String?,
      status: json['status'] as String,
      phase: json['phase'] as String,
      teamAName: json['teamAName'] as String?,
      teamBName: json['teamBName'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$GameSummaryDTOToJson(_GameSummaryDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dateTime': instance.dateTime,
      'status': instance.status,
      'phase': instance.phase,
      'teamAName': instance.teamAName,
      'teamBName': instance.teamBName,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
