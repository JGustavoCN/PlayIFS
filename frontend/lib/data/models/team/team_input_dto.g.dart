// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_input_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TeamInputDTO _$TeamInputDTOFromJson(Map<String, dynamic> json) =>
    _TeamInputDTO(
      name: json['name'] as String,
      competitionId: (json['competitionId'] as num).toInt(),
      sportId: (json['sportId'] as num).toInt(),
      courseId: (json['courseId'] as num).toInt(),
      coachId: (json['coachId'] as num).toInt(),
      athleteIds: (json['athleteIds'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$TeamInputDTOToJson(_TeamInputDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'competitionId': instance.competitionId,
      'sportId': instance.sportId,
      'courseId': instance.courseId,
      'coachId': instance.coachId,
      'athleteIds': instance.athleteIds,
    };
