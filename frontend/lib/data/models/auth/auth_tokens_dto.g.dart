// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_tokens_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthTokensDTO _$AuthTokensDTOFromJson(Map<String, dynamic> json) =>
    _AuthTokensDTO(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$AuthTokensDTOToJson(_AuthTokensDTO instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
