import 'package:freezed_annotation/freezed_annotation.dart';
import 'field_error.dart';

part 'api_validation_error.freezed.dart';
part 'api_validation_error.g.dart';

@freezed
abstract class ApiValidationError with _$ApiValidationError {
  const factory ApiValidationError({
    required int status,
    required String error,
    required List<FieldError> errors,
    required String path,
    required String timestamp,
  }) = _ApiValidationError;

  factory ApiValidationError.fromJson(Map<String, dynamic> json) =>
      _$ApiValidationErrorFromJson(json);
}