import 'package:freezed_annotation/freezed_annotation.dart';

// As diretivas 'part' usam snake_case para corresponder ao nome do ficheiro,
// que por convenção do Dart é 'auth_tokens_dto.dart'.
part 'auth_tokens_dto.freezed.dart';
part 'auth_tokens_dto.g.dart';

@freezed
// 1. CORREÇÃO: A classe agora é 'abstract', conforme o manual.
abstract class AuthTokensDTO with _$AuthTokensDTO {

  // 2. CORREÇÃO: A anotação @JsonSerializable foi removida daqui.
  const factory AuthTokensDTO({
    required String accessToken,
    required String refreshToken,
  }) = _AuthTokensDTO;

  /// Este construtor ativa a geração dos métodos fromJson e toJson.
  factory AuthTokensDTO.fromJson(Map<String, dynamic> json) =>
      _$AuthTokensDTOFromJson(json);
}