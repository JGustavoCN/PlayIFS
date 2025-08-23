// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'designated_coach_summary_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DesignatedCoachSummaryDTO _$DesignatedCoachSummaryDTOFromJson(
  Map<String, dynamic> json,
) => _DesignatedCoachSummaryDTO(
  id: (json['id'] as num).toInt(),
  competitionName: json['competitionName'] as String,
  sportName: json['sportName'] as String,
  courseName: json['courseName'] as String,
  athleteName: json['athleteName'] as String,
);

Map<String, dynamic> _$DesignatedCoachSummaryDTOToJson(
  _DesignatedCoachSummaryDTO instance,
) => <String, dynamic>{
  'id': instance.id,
  'competitionName': instance.competitionName,
  'sportName': instance.sportName,
  'courseName': instance.courseName,
  'athleteName': instance.athleteName,
};
