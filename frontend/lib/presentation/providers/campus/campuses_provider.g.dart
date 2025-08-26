// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campuses_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(CampusesNotifier)
const campusesNotifierProvider = CampusesNotifierProvider._();

final class CampusesNotifierProvider
    extends $AsyncNotifierProvider<CampusesNotifier, Page<CampusSummary>> {
  const CampusesNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'campusesNotifierProvider',
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

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
