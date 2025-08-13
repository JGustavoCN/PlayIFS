// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_validation_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApiValidationError _$ApiValidationErrorFromJson(Map<String, dynamic> json) =>
    _ApiValidationError(
      status: (json['status'] as num).toInt(),
      error: json['error'] as String,
      errors: (json['errors'] as List<dynamic>)
          .map((e) => FieldError.fromJson(e as Map<String, dynamic>))
          .toList(),
      path: json['path'] as String,
      timestamp: json['timestamp'] as String,
    );

Map<String, dynamic> _$ApiValidationErrorToJson(_ApiValidationError instance) =>
    <String, dynamic>{
      'status': instance.status,
      'error': instance.error,
      'errors': instance.errors,
      'path': instance.path,
      'timestamp': instance.timestamp,
    };
