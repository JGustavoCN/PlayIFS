// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordinator_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CoordinatorDetailsDTO _$CoordinatorDetailsDTOFromJson(
  Map<String, dynamic> json,
) => _CoordinatorDetailsDTO(
  id: (json['id'] as num).toInt(),
  registration: json['registration'] as String,
  name: json['name'] as String,
  email: json['email'] as String,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  links: (json['links'] as List<dynamic>?)
      ?.map((e) => LinkDTO.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CoordinatorDetailsDTOToJson(
  _CoordinatorDetailsDTO instance,
) => <String, dynamic>{
  'id': instance.id,
  'registration': instance.registration,
  'name': instance.name,
  'email': instance.email,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'links': instance.links,
};
