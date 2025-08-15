// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'athlete_update_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AthleteUpdateDTO _$AthleteUpdateDTOFromJson(Map<String, dynamic> json) =>
    _AthleteUpdateDTO(
      registration: json['registration'] as String,
      fullName: json['fullName'] as String,
      nickname: json['nickname'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String,
    );

Map<String, dynamic> _$AthleteUpdateDTOToJson(_AthleteUpdateDTO instance) =>
    <String, dynamic>{
      'registration': instance.registration,
      'fullName': instance.fullName,
      'nickname': instance.nickname,
      'phone': instance.phone,
      'email': instance.email,
    };
