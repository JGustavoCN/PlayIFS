// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'games_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(GamesListNotifier)
const gamesListNotifierProvider = GamesListNotifierProvider._();

final class GamesListNotifierProvider
    extends $AsyncNotifierProvider<GamesListNotifier, Page<GameSummary>> {
  const GamesListNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gamesListNotifierProvider',
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

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
