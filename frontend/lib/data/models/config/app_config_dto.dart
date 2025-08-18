// Ficheiro: lib/data/models/config/app_config_dto.dart

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playifs_frontend/data/models/config/enum_value_dto.dart';

part 'app_config_dto.freezed.dart';
part 'app_config_dto.g.dart';

/// Representa o corpo da resposta da API para as configurações da aplicação.
///
/// Contém um mapa onde cada chave é o nome de um enum e o valor é a lista
/// de suas possíveis entradas.
@freezed
abstract class AppConfigDTO with _$AppConfigDTO {
  /// Construtor factory para o DTO.
  const factory AppConfigDTO({
    required Map<String, List<EnumValueDTO>> enums,
  }) = _AppConfigDTO;

  /// Construtor factory para desserialização a partir de um JSON.
  factory AppConfigDTO.fromJson(Map<String, dynamic> json) =>
      _$AppConfigDTOFromJson(json);
}