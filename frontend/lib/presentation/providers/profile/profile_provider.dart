import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:playifs_frontend/core/di/locator.dart';
import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/user/profile.dart';
import 'package:playifs_frontend/domain/usecases/profile/get_profile_use_case.dart';
import 'package:playifs_frontend/presentation/providers/auth/auth_provider.dart';
import 'package:playifs_frontend/presentation/providers/auth/auth_state.dart';

part 'profile_provider.g.dart';

@Riverpod(keepAlive: true)
class ProfileNotifier extends _$ProfileNotifier {
  @override
  Future<Profile> build() async {
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

    // ✅ CORREÇÃO: Adicionados os parênteses () para EXECUTAR o UseCase.

    final result = await getProfileUseCase.execute();

    return result.when(
      success: (profile) => profile,
      failure: (err) => throw err,
    );
  }

  void replace(Profile newProfile) {
    state = AsyncValue.data(newProfile);
  }

  Future<void> refreshProfile() async {
    ref.invalidateSelf();
    await future;
  }
}