// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'competition_summary_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CompetitionSummaryDTO _$CompetitionSummaryDTOFromJson(
  Map<String, dynamic> json,
) => _CompetitionSummaryDTO(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  level: json['level'] as String,
);

Map<String, dynamic> _$CompetitionSummaryDTOToJson(
  _CompetitionSummaryDTO instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'level': instance.level,
};
