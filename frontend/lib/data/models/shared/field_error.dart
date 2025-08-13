import 'package:freezed_annotation/freezed_annotation.dart';

part 'field_error.freezed.dart';
part 'field_error.g.dart';

@freezed
abstract class FieldError with _$FieldError {
  const factory FieldError({
    required String fieldName,
    required String message,
  }) = _FieldError;

  factory FieldError.fromJson(Map<String, dynamic> json) => _$FieldErrorFromJson(json);
}