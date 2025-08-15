// Ficheiro: lib/core/network/result.dart

import 'package:freezed_annotation/freezed_annotation.dart';

// A diretiva 'part' está correta em snake_case, espelhando o nome do ficheiro.
part 'result.freezed.dart';

@freezed
// A classe está correta em PascalCase, usando 'sealed'.
sealed class Result<T> with _$Result<T> {
  const factory Result.success(T data) = Success<T>;
  const factory Result.failure(Exception error) = Failure<T>;
}