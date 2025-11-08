// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_details_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GameDetailsNotifier)
const gameDetailsProvider = GameDetailsNotifierFamily._();

final class GameDetailsNotifierProvider
    extends $AsyncNotifierProvider<GameDetailsNotifier, GameDetails> {
  const GameDetailsNotifierProvider._({
    required GameDetailsNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'gameDetailsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$gameDetailsNotifierHash();

  @override
  String toString() {
    return r'gameDetailsProvider'
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
        name: r'gameDetailsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GameDetailsNotifierProvider call(int gameId) =>
      GameDetailsNotifierProvider._(argument: gameId, from: this);

  @override
  String toString() => r'gameDetailsProvider';
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
