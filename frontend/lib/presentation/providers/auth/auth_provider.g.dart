// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(LoginFormErrors)
const loginFormErrorsProvider = LoginFormErrorsProvider._();

final class LoginFormErrorsProvider
    extends $NotifierProvider<LoginFormErrors, Map<String, String>> {
  const LoginFormErrorsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginFormErrorsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginFormErrorsHash();

  @$internal
  @override
  LoginFormErrors create() => LoginFormErrors();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<String, String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, String>>(value),
    );
  }
}

String _$loginFormErrorsHash() => r'8c3b0669aeab3f1cc852b2927eb420770ce1e409';

abstract class _$LoginFormErrors extends $Notifier<Map<String, String>> {
  Map<String, String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Map<String, String>, Map<String, String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Map<String, String>, Map<String, String>>,
              Map<String, String>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(Auth)
const authProvider = AuthProvider._();

final class AuthProvider extends $AsyncNotifierProvider<Auth, AuthState> {
  const AuthProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authHash();

  @$internal
  @override
  Auth create() => Auth();
}

String _$authHash() => r'75d3ea41e22f64810cf3f6c36d20fa9ec495f43c';

abstract class _$Auth extends $AsyncNotifier<AuthState> {
  FutureOr<AuthState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<AuthState>, AuthState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AuthState>, AuthState>,
              AsyncValue<AuthState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
