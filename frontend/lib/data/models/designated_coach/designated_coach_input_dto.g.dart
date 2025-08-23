// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'designated_coach_input_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DesignatedCoachInputDTO _$DesignatedCoachInputDTOFromJson(
  Map<String, dynamic> json,
) => _DesignatedCoachInputDTO(
  competitionId: (json['competitionId'] as num).toInt(),
  sportId: (json['sportId'] as num).toInt(),
  courseId: (json['courseId'] as num).toInt(),
  coachId: (json['athleteId'] as num).toInt(),
);

Map<String, dynamic> _$DesignatedCoachInputDTOToJson(
  _DesignatedCoachInputDTO instance,
) => <String, dynamic>{
  'competitionId': instance.competitionId,
  'sportId': instance.sportId,
  'courseId': instance.courseId,
  'athleteId': instance.coachId,
};
