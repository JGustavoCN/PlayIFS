// Ficheiro: lib/data/models/shared/api_response_body.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response_body.freezed.dart';
part 'api_response_body.g.dart';

// CORREÇÃO: A anotação deve ser '@freezed' em minúsculas.
// A configuração 'genericArgumentFactories' está correta.
@Freezed(genericArgumentFactories: true)
abstract class ApiResponseBody<T> with _$ApiResponseBody<T> {
  const factory ApiResponseBody({
    required T data,
  }) = _ApiResponseBody<T>;

  // A sua implementação do fromJson para genéricos está perfeita.
  factory ApiResponseBody.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT,) => _$ApiResponseBodyFromJson(json, fromJsonT);
}