// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'athlete_summary_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AthleteSummaryDTO _$AthleteSummaryDTOFromJson(Map<String, dynamic> json) =>
    _AthleteSummaryDTO(
      id: (json['id'] as num).toInt(),
      registration: json['registration'] as String,
      fullName: json['fullName'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$AthleteSummaryDTOToJson(_AthleteSummaryDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'registration': instance.registration,
      'fullName': instance.fullName,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
