// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

/// Provider que busca e armazena em cache as configurações da aplicação.
///
/// Utiliza um [AsyncNotifier] porque os dados são carregados uma única vez
/// e permanecem constantes durante a sessão do usuário.
@ProviderFor(AppConfigNotifier)
const appConfigNotifierProvider = AppConfigNotifierProvider._();

/// Provider que busca e armazena em cache as configurações da aplicação.
///
/// Utiliza um [AsyncNotifier] porque os dados são carregados uma única vez
/// e permanecem constantes durante a sessão do usuário.
final class AppConfigNotifierProvider
    extends $AsyncNotifierProvider<AppConfigNotifier, AppConfig> {
  /// Provider que busca e armazena em cache as configurações da aplicação.
  ///
  /// Utiliza um [AsyncNotifier] porque os dados são carregados uma única vez
  /// e permanecem constantes durante a sessão do usuário.
  const AppConfigNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appConfigNotifierProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appConfigNotifierHash();

  @$internal
  @override
  AppConfigNotifier create() => AppConfigNotifier();
}

String _$appConfigNotifierHash() => r'e4ec473fe55f2d0a4db4cbc1826d152056c06c57';

abstract class _$AppConfigNotifier extends $AsyncNotifier<AppConfig> {
  FutureOr<AppConfig> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<AppConfig>, AppConfig>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AppConfig>, AppConfig>,
              AsyncValue<AppConfig>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
