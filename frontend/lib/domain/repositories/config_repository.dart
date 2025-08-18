// Ficheiro: lib/domain/repositories/config_repository.dart

import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/config/app_config.dart';

/// Contrato para a fonte de dados de configuração da aplicação.
///
/// Define a interface que a camada de domínio usa para obter as
/// configurações dinâmicas, abstraindo os detalhes de implementação.
abstract class ConfigRepository {
  /// Busca as configurações da aplicação.
  ///
  /// Retorna um [Result] que encapsula o sucesso com [AppConfig] ou
  /// uma falha com uma [Exception].
  Future<Result<AppConfig>> getAppConfig();
}