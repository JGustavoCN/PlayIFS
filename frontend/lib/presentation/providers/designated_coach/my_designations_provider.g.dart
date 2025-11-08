// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_designations_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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

String _$myDesignationsHash() => r'3247567bfbb8f18e0ade0d7878a5237554f0ffd3';

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
