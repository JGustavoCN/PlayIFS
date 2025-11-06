// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_action_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(GameActionNotifier)
const gameActionNotifierProvider = GameActionNotifierProvider._();

final class GameActionNotifierProvider
    extends $NotifierProvider<GameActionNotifier, GameActionState> {
  const GameActionNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gameActionNotifierProvider',
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
    r'b4cd41ca29085470c7e4cd4466d7542c3c9b4962';

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

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
