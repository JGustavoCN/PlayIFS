import 'package:playifs_frontend/core/di/locator.dart';
import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/config/app_config.dart';
import 'package:playifs_frontend/domain/usecases/config/get_app_config_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_config_provider.g.dart';

/// Provider que busca e armazena em cache as configurações da aplicação.
///
/// Utiliza um [AsyncNotifier] porque os dados são carregados uma única vez
/// e permanecem constantes durante a sessão do usuário.
@Riverpod(keepAlive: true)
class AppConfigNotifier extends _$AppConfigNotifier {
  /// O método `build` é chamado automaticamente pelo Riverpod para inicializar o estado.
  @override
  Future<AppConfig> build() async {
    // A lógica interna é exatamente a mesma de antes.
    final getAppConfigUseCase = locator<GetAppConfigUseCase>();
    final result = await getAppConfigUseCase.execute();

    return result.when(
      success: (config) => config,
      failure: (exception) => throw exception,
    );
  }
}