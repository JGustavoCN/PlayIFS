import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/di/locator.dart';
import '../../../core/network/result.dart';
import '../../../domain/entities/user/profile.dart';
import '../../../domain/usecases/profile/get_profile_use_case.dart';
import '../auth/auth_provider.dart';
import '../auth/auth_state.dart';

// ADICIONE ESTA LINHA ESSENCIAL
part 'profile_provider.g.dart';

@riverpod
class ProfileNotifier extends _$ProfileNotifier {
  @override
  Future<Profile> build() async {
    final authStateAsync = ref.watch(authProvider);

    final isLoggedIn = authStateAsync.when(
      data: (actualAuthState) {
        return actualAuthState.maybeWhen(
          authenticated: (_) => true,
          orElse: () => false,
        );
      },
      loading: () => false,
      error: (_, __) => false,
    );

    if (!isLoggedIn) {
      throw Exception('Utilizador não autenticado.');
    }

    final getProfileUseCase = locator<GetProfileUseCase>();
    final result = await getProfileUseCase.execute();

    return switch (result) {
      Success(data: final profile) => profile,
      Failure(message: final msg) => throw Exception(msg),
    };
  }

  Future<void> refreshProfile() async {
    ref.invalidateSelf();
    await future;
  }
}