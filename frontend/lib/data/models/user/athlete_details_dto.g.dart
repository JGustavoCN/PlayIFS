// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'athlete_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AthleteDetailsDTO _$AthleteDetailsDTOFromJson(Map<String, dynamic> json) =>
    _AthleteDetailsDTO(
      id: (json['id'] as num).toInt(),
      registration: json['registration'] as String,
      fullName: json['fullName'] as String,
      nickname: json['nickname'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String,
      isCoach: json['coach'] as bool,
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

Map<String, dynamic> _$AthleteDetailsDTOToJson(_AthleteDetailsDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'registration': instance.registration,
      'fullName': instance.fullName,
      'nickname': instance.nickname,
      'phone': instance.phone,
      'email': instance.email,
      'coach': instance.isCoach,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'links': instance.links,
    };
