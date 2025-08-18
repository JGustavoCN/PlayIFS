// Ficheiro: lib/data/models/config/enum_value_dto.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'enum_value_dto.freezed.dart';
part 'enum_value_dto.g.dart';

/// Representa um par de nome/valor de um enum vindo da API.
///
/// Corresponde diretamente à estrutura de EnumValueDTO no backend.
@freezed
abstract class EnumValueDTO with _$EnumValueDTO {
  /// Construtor factory para o DTO.
  const factory EnumValueDTO({
    required String name,
    required String value,
  }) = _EnumValueDTO;

  /// Construtor factory para desserialização a partir de um JSON.
  /// Essencial para a integração com Retrofit e json_serializable.
  factory EnumValueDTO.fromJson(Map<String, dynamic> json) =>
      _$EnumValueDTOFromJson(json);
}