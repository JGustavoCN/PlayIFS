// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'competitions_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CompetitionsNotifier)
const competitionsProvider = CompetitionsNotifierProvider._();

final class CompetitionsNotifierProvider
    extends
        $AsyncNotifierProvider<CompetitionsNotifier, Page<CompetitionSummary>> {
  const CompetitionsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'competitionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$competitionsNotifierHash();

  @$internal
  @override
  CompetitionsNotifier create() => CompetitionsNotifier();
}

String _$competitionsNotifierHash() =>
    r'8fbfe75a766312944ee4ee94553777b58dcc93c2';

abstract class _$CompetitionsNotifier
    extends $AsyncNotifier<Page<CompetitionSummary>> {
  FutureOr<Page<CompetitionSummary>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              AsyncValue<Page<CompetitionSummary>>,
              Page<CompetitionSummary>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<Page<CompetitionSummary>>,
                Page<CompetitionSummary>
              >,
              AsyncValue<Page<CompetitionSummary>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
