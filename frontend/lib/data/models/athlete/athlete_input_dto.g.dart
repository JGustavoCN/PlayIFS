// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'athlete_input_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AthleteInputDTO _$AthleteInputDTOFromJson(Map<String, dynamic> json) =>
    _AthleteInputDTO(
      registration: json['registration'] as String,
      fullName: json['fullName'] as String,
      nickname: json['nickname'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$AthleteInputDTOToJson(_AthleteInputDTO instance) =>
    <String, dynamic>{
      'registration': instance.registration,
      'fullName': instance.fullName,
      'nickname': instance.nickname,
      'phone': instance.phone,
      'email': instance.email,
      'password': instance.password,
    };
