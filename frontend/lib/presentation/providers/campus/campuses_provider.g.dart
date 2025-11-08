// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campuses_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CampusesNotifier)
const campusesProvider = CampusesNotifierProvider._();

final class CampusesNotifierProvider
    extends $AsyncNotifierProvider<CampusesNotifier, Page<CampusSummary>> {
  const CampusesNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'campusesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$campusesNotifierHash();

  @$internal
  @override
  CampusesNotifier create() => CampusesNotifier();
}

String _$campusesNotifierHash() => r'5484578a5cce21596b3ce538659eb7e32a13de7f';

abstract class _$CampusesNotifier extends $AsyncNotifier<Page<CampusSummary>> {
  FutureOr<Page<CampusSummary>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<Page<CampusSummary>>, Page<CampusSummary>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Page<CampusSummary>>, Page<CampusSummary>>,
              AsyncValue<Page<CampusSummary>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
