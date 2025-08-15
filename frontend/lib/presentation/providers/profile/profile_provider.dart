import 'package:playifs_frontend/presentation/providers/auth/auth_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/di/locator.dart';
import '../../../core/network/result.dart';
import '../../../domain/entities/user/profile.dart';
import '../../../domain/usecases/profile/get_profile_use_case.dart';
import '../auth/auth_provider.dart';

part 'profile_provider.g.dart';

@riverpod
class ProfileNotifier extends _$ProfileNotifier {
  @override
  Future<Profile> build() async {
    // 1. A SUA LÓGICA DE BUILD CORRETA E ROBUSTA
    //    Verifica a autenticação e depois busca o perfil via UseCase.
    final authStateAsync = ref.watch(authProvider);

    final isAuthenticated = authStateAsync.maybeWhen(
      data: (state) => state.maybeWhen(
        authenticated: (_) => true,
        orElse: () => false,
      ),
      orElse: () => false,
    );

    if (!isAuthenticated) {
      throw Exception('Utilizador não autenticado.');
    }

    final getProfileUseCase = locator<GetProfileUseCase>();
    final result = await getProfileUseCase.execute();

    return result.when(
      success: (profile) => profile,
      failure: (err) => throw err,
    );
  }

  /// ✅ 2. O MÉTODO 'REPLACE' QUE PERMITE ATUALIZAÇÕES OTIMISTAS
  ///    Atualiza o estado do perfil localmente, sem uma nova chamada à API.
  ///    Será chamado pelo `athlete_form_provider`.
  void replace(Profile newProfile) {
    state = AsyncValue.data(newProfile);
  }

  /// 3. O SEU MÉTODO 'REFRESH'
  ///    Invalida o estado para forçar uma nova execução do `build`.
  Future<void> refreshProfile() async {
    ref.invalidateSelf();
    await future;
  }
}