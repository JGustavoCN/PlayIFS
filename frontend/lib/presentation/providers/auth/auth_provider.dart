import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/di/locator.dart';
import '../../../core/network/exceptions.dart';
import '../../../core/network/result.dart';
import '../../../data/models/shared/field_error.dart';
import '../../../data/services/token_storage_service.dart';
import '../../../domain/entities/auth/login_credentials.dart';
import '../../../domain/usecases/auth/login_use_case.dart';
import '../../../domain/usecases/profile/get_profile_use_case.dart';
import 'auth_state.dart';

part 'auth_provider.g.dart';

@riverpod
class LoginFormErrors extends _$LoginFormErrors {
  @override
  Map<String, String> build() => {};

  void setErrors(List<FieldError> errors) =>
      state = {for (var e in errors) e.fieldName: e.message};

  void clearErrors() => state = {};
}

@riverpod
class Auth extends _$Auth {
  @override
  Future<AuthState> build() async {
    final tokenService = locator<TokenStorageService>();
    final getProfileUseCase = locator<GetProfileUseCase>();

    final tokens = await tokenService.getTokens();
    if (tokens == null) {
      return const AuthState.unauthenticated();
    }

    final profileResult = await getProfileUseCase.execute();
    return switch (profileResult) {
      Success(data: final profile) => AuthState.authenticated(profile),
      Failure() => const AuthState.unauthenticated(),
    };
  }

  Future<void> login(String registration, String password) async {
    final loginUseCase = locator<LoginUseCase>();
    final tokenService = locator<TokenStorageService>();
    final getProfileUseCase = locator<GetProfileUseCase>();

    ref.read(loginFormErrorsProvider.notifier).clearErrors();
    state = const AsyncValue.loading();

    final credentials = LoginCredentials(registration: registration, password: password);
    final result = await loginUseCase.execute(credentials);

    await result.when(
      success: (tokens) async {
        await tokenService.saveTokens(tokens);
        final profileResult = await getProfileUseCase.execute();

        state = switch (profileResult) {
          Success(data: final profile) =>
              AsyncValue.data(AuthState.authenticated(profile)),
          Failure(error: final err) =>
              AsyncValue.data(AuthState.failure(err.toString())),
        };
      },
      failure: (Exception err) {
        if (err is ValidationException) {
          ref
              .read(loginFormErrorsProvider.notifier)
              .setErrors(err.errorDetails.errors);
        }
        state = AsyncValue.data(AuthState.failure(err.toString()));
      },
    );
  }

  Future<void> logout() async {
    final tokenService = locator<TokenStorageService>();
    await tokenService.clearTokens();
    state = const AsyncValue.data(AuthState.unauthenticated());
  }
}