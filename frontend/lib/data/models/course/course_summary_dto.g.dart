// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_summary_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CourseSummaryDTO _$CourseSummaryDTOFromJson(Map<String, dynamic> json) =>
    _CourseSummaryDTO(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      level: json['level'] as String,
      campusName: json['campusName'] as String,
    );

Map<String, dynamic> _$CourseSummaryDTOToJson(_CourseSummaryDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'level': instance.level,
      'campusName': instance.campusName,
    };
