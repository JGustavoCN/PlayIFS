import 'package:freezed_annotation/freezed_annotation.dart';

// 1. CORREÇÃO DE CONVENÇÃO: Usar snake_case para corresponder ao nome do ficheiro.
part 'login_request_dto.freezed.dart';
part 'login_request_dto.g.dart';

@freezed
abstract class LoginRequestDTO with _$LoginRequestDTO {
  // 2. CORREÇÃO DE SINTAXE: Removida a anotação @JsonSerializable daqui.
  const factory LoginRequestDTO({
    required String registration,
    required String password,
  }) = _LoginRequestDTO;

  // A presença deste factory já é suficiente para o json_serializable
  // gerar tanto o 'fromJson' quanto o 'toJson'.
  factory LoginRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestDTOFromJson(json);
}