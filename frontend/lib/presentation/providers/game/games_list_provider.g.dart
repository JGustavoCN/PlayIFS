// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'games_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GamesListNotifier)
const gamesListProvider = GamesListNotifierProvider._();

final class GamesListNotifierProvider
    extends $AsyncNotifierProvider<GamesListNotifier, Page<GameSummary>> {
  const GamesListNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gamesListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gamesListNotifierHash();

  @$internal
  @override
  GamesListNotifier create() => GamesListNotifier();
}

String _$gamesListNotifierHash() => r'212fafc0592b4b85da42363a35f5f80cc62892af';

abstract class _$GamesListNotifier extends $AsyncNotifier<Page<GameSummary>> {
  FutureOr<Page<GameSummary>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<Page<GameSummary>>, Page<GameSummary>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Page<GameSummary>>, Page<GameSummary>>,
              AsyncValue<Page<GameSummary>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
