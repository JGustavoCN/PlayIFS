// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sports_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SportsNotifier)
const sportsProvider = SportsNotifierProvider._();

final class SportsNotifierProvider
    extends $AsyncNotifierProvider<SportsNotifier, Page<SportSummary>> {
  const SportsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sportsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sportsNotifierHash();

  @$internal
  @override
  SportsNotifier create() => SportsNotifier();
}

String _$sportsNotifierHash() => r'70e77faac11f53ff949d8d60cf83d58a68c661b7';

abstract class _$SportsNotifier extends $AsyncNotifier<Page<SportSummary>> {
  FutureOr<Page<SportSummary>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<Page<SportSummary>>, Page<SportSummary>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Page<SportSummary>>, Page<SportSummary>>,
              AsyncValue<Page<SportSummary>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
