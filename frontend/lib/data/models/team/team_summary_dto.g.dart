// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_summary_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TeamSummaryDTO _$TeamSummaryDTOFromJson(Map<String, dynamic> json) =>
    _TeamSummaryDTO(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$TeamSummaryDTOToJson(_TeamSummaryDTO instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
