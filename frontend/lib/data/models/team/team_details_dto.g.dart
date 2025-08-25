// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TeamDetailsDTO _$TeamDetailsDTOFromJson(Map<String, dynamic> json) =>
    _TeamDetailsDTO(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      competition: CompetitionSummaryDTO.fromJson(
        json['competition'] as Map<String, dynamic>,
      ),
      sport: SportSummaryDTO.fromJson(json['sport'] as Map<String, dynamic>),
      course: CourseSummaryDTO.fromJson(json['course'] as Map<String, dynamic>),
      coach: AthleteSummaryDTO.fromJson(json['coach'] as Map<String, dynamic>),
      athletes: (json['athletes'] as List<dynamic>)
          .map((e) => AthleteSummaryDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TeamDetailsDTOToJson(_TeamDetailsDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'competition': instance.competition,
      'sport': instance.sport,
      'course': instance.course,
      'coach': instance.coach,
      'athletes': instance.athletes,
    };
