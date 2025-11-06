// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_details_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(GameDetailsNotifier)
const gameDetailsNotifierProvider = GameDetailsNotifierFamily._();

final class GameDetailsNotifierProvider
    extends $AsyncNotifierProvider<GameDetailsNotifier, GameDetails> {
  const GameDetailsNotifierProvider._({
    required GameDetailsNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'gameDetailsNotifierProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$gameDetailsNotifierHash();

  @override
  String toString() {
    return r'gameDetailsNotifierProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  GameDetailsNotifier create() => GameDetailsNotifier();

  @override
  bool operator ==(Object other) {
    return other is GameDetailsNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$gameDetailsNotifierHash() =>
    r'a61c68d16f48536049935316226ade20cacdc424';

final class GameDetailsNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          GameDetailsNotifier,
          AsyncValue<GameDetails>,
          GameDetails,
          FutureOr<GameDetails>,
          int
        > {
  const GameDetailsNotifierFamily._()
    : super(
        retry: null,
        name: r'gameDetailsNotifierProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GameDetailsNotifierProvider call(int gameId) =>
      GameDetailsNotifierProvider._(argument: gameId, from: this);

  @override
  String toString() => r'gameDetailsNotifierProvider';
}

abstract class _$GameDetailsNotifier extends $AsyncNotifier<GameDetails> {
  late final _$args = ref.$arg as int;
  int get gameId => _$args;

  FutureOr<GameDetails> build(int gameId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<GameDetails>, GameDetails>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<GameDetails>, GameDetails>,
              AsyncValue<GameDetails>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
