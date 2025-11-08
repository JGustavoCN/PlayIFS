// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_action_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GameActionNotifier)
const gameActionProvider = GameActionNotifierProvider._();

final class GameActionNotifierProvider
    extends $NotifierProvider<GameActionNotifier, GameActionState> {
  const GameActionNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gameActionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gameActionNotifierHash();

  @$internal
  @override
  GameActionNotifier create() => GameActionNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GameActionState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GameActionState>(value),
    );
  }
}

String _$gameActionNotifierHash() =>
    r'ddf84b12e65cba69513e5d664ad7ab3417d56ae0';

abstract class _$GameActionNotifier extends $Notifier<GameActionState> {
  GameActionState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<GameActionState, GameActionState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<GameActionState, GameActionState>,
              GameActionState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
