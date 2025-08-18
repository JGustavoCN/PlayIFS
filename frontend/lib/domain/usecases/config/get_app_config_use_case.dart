// Ficheiro: lib/domain/usecases/config/get_app_config_use_case.dart

import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/config/app_config.dart';
import 'package:playifs_frontend/domain/repositories/config_repository.dart';

/// Caso de uso responsável por obter as configurações da aplicação.
///
/// Encapsula a lógica de negócio para a ação de buscar as configurações,
/// orquestrando a chamada ao repositório correspondente.
class GetAppConfigUseCase {
  /// Construtor que recebe a abstração do repositório.
  const GetAppConfigUseCase(this._repository);

  final ConfigRepository _repository;

  /// Executa o caso de uso.
  Future<Result<AppConfig>> execute() => _repository.getAppConfig();
}