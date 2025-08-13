// Ficheiro: lib/domain/entities/auth/auth_tokens.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_tokens.freezed.dart';
// 1. ADICIONAR ESTA LINHA para ligar ao código de serialização.
part 'auth_tokens.g.dart';

@freezed
abstract class AuthTokens with _$AuthTokens {
  const factory AuthTokens({
    required String accessToken,
    required String refreshToken,
  }) = _AuthTokens;

  // 2. ADICIONAR ESTE FACTORY para habilitar a geração de toJson/fromJson.
  factory AuthTokens.fromJson(Map<String, dynamic> json) =>
      _$AuthTokensFromJson(json);
}