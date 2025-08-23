// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'designated_coach_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DesignatedCoachDetailsDTO _$DesignatedCoachDetailsDTOFromJson(
  Map<String, dynamic> json,
) => _DesignatedCoachDetailsDTO(
  id: (json['id'] as num).toInt(),
  competition: CompetitionSummaryDTO.fromJson(
    json['competition'] as Map<String, dynamic>,
  ),
  sport: SportSummaryDTO.fromJson(json['sport'] as Map<String, dynamic>),
  course: CourseSummaryDTO.fromJson(json['course'] as Map<String, dynamic>),
  coach: AthleteSummaryDTO.fromJson(json['coach'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DesignatedCoachDetailsDTOToJson(
  _DesignatedCoachDetailsDTO instance,
) => <String, dynamic>{
  'id': instance.id,
  'competition': instance.competition,
  'sport': instance.sport,
  'course': instance.course,
  'coach': instance.coach,
};
