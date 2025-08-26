// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courses_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(CoursesNotifier)
const coursesNotifierProvider = CoursesNotifierProvider._();

final class CoursesNotifierProvider
    extends $AsyncNotifierProvider<CoursesNotifier, Page<CourseSummary>> {
  const CoursesNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'coursesNotifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$coursesNotifierHash();

  @$internal
  @override
  CoursesNotifier create() => CoursesNotifier();
}

String _$coursesNotifierHash() => r'd309f758fe2576263b01b16c8cbf718ddb62d2b4';

abstract class _$CoursesNotifier extends $AsyncNotifier<Page<CourseSummary>> {
  FutureOr<Page<CourseSummary>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<Page<CourseSummary>>, Page<CourseSummary>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Page<CourseSummary>>, Page<CourseSummary>>,
              AsyncValue<Page<CourseSummary>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
