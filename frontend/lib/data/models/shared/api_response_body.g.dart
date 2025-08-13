// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApiResponseBody<T> _$ApiResponseBodyFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _ApiResponseBody<T>(data: fromJsonT(json['data']));

Map<String, dynamic> _$ApiResponseBodyToJson<T>(
  _ApiResponseBody<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{'data': toJsonT(instance.data)};
