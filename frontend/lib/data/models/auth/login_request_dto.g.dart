// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginRequestDTO _$LoginRequestDTOFromJson(Map<String, dynamic> json) =>
    _LoginRequestDTO(
      registration: json['registration'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginRequestDTOToJson(_LoginRequestDTO instance) =>
    <String, dynamic>{
      'registration': instance.registration,
      'password': instance.password,
    };
