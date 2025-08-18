// Ficheiro: lib/data/mappers/config_mappers.dart

import 'package:playifs_frontend/data/models/config/app_config_dto.dart';
import 'package:playifs_frontend/data/models/config/enum_value_dto.dart';
import 'package:playifs_frontend/domain/entities/config/app_config.dart';

/// Extension method para converter um [AppConfigDTO] em uma entidade [AppConfig].
///
/// Esta é a ponte entre a camada de Dados e a camada de Domínio.
extension AppConfigDTOToEntity on AppConfigDTO {
  /// Converte o DTO em uma entidade de domínio.
  AppConfig toEntity() {
    // Função auxiliar para extrair e mapear a lista de valores de um enum.
    // É mais robusta, pois retorna uma lista vazia se a chave não for encontrada.
    List<String> _extractEnumValues(String key) {
      final List<EnumValueDTO>? enumList = enums[key];
      if (enumList == null) {
        return [];
      }
      return enumList.map((dto) => dto.value).toList();
    }

    return AppConfig(
      courseLevels: _extractEnumValues('CourseLevel'),
      gamePhases: _extractEnumValues('GamePhase'),
      gameStatuses: _extractEnumValues('GameStatus'),
    );
  }
}