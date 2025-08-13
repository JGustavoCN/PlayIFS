// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FieldError _$FieldErrorFromJson(Map<String, dynamic> json) => _FieldError(
  fieldName: json['fieldName'] as String,
  message: json['message'] as String,
);

Map<String, dynamic> _$FieldErrorToJson(_FieldError instance) =>
    <String, dynamic>{
      'fieldName': instance.fieldName,
      'message': instance.message,
    };
