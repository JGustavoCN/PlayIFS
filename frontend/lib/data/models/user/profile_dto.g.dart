// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileDTO _$ProfileDTOFromJson(Map<String, dynamic> json) => _ProfileDTO(
  userId: (json['userId'] as num).toInt(),
  registration: json['registration'] as String,
  roles: (json['roles'] as List<dynamic>).map((e) => e as String).toList(),
  athleteProfile: json['athleteProfile'] == null
      ? null
      : AthleteDetailsDTO.fromJson(
          json['athleteProfile'] as Map<String, dynamic>,
        ),
  coordinatorProfile: json['coordinatorProfile'] == null
      ? null
      : CoordinatorDetailsDTO.fromJson(
          json['coordinatorProfile'] as Map<String, dynamic>,
        ),
  links: (json['links'] as List<dynamic>?)
      ?.map((e) => LinkDTO.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ProfileDTOToJson(_ProfileDTO instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'registration': instance.registration,
      'roles': instance.roles,
      'athleteProfile': instance.athleteProfile,
      'coordinatorProfile': instance.coordinatorProfile,
      'links': instance.links,
    };
