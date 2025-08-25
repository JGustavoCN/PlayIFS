// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_designations_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(MyDesignations)
const myDesignationsProvider = MyDesignationsProvider._();

final class MyDesignationsProvider
    extends
        $AsyncNotifierProvider<MyDesignations, List<DesignatedCoachSummary>> {
  const MyDesignationsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'myDesignationsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$myDesignationsHash();

  @$internal
  @override
  MyDesignations create() => MyDesignations();
}

String _$myDesignationsHash() => r'0eff72676e6c69a0b49eb0fa8280035506de5571';

abstract class _$MyDesignations
    extends $AsyncNotifier<List<DesignatedCoachSummary>> {
  FutureOr<List<DesignatedCoachSummary>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<DesignatedCoachSummary>>,
              List<DesignatedCoachSummary>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<DesignatedCoachSummary>>,
                List<DesignatedCoachSummary>
              >,
              AsyncValue<List<DesignatedCoachSummary>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
