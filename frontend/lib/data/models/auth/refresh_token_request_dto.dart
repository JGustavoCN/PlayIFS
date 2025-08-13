import 'package:freezed_annotation/freezed_annotation.dart';

// As diretivas 'part' usam snake_case para corresponder ao nome do ficheiro.
part 'refresh_token_request_dto.freezed.dart';
part 'refresh_token_request_dto.g.dart';

@freezed
// 1. CORREÇÃO: A classe agora é 'abstract', conforme o manual.
abstract class RefreshTokenRequestDTO with _$RefreshTokenRequestDTO {

  // 2. CORREÇÃO: A anotação @JsonSerializable foi removida daqui.
  const factory RefreshTokenRequestDTO({
    required String refreshToken,
  }) = _RefreshTokenRequestDTO;

  /// Este construtor ativa a geração dos métodos fromJson e toJson.
  factory RefreshTokenRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenRequestDTOFromJson(json);
}