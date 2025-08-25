// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'designated_coach_details_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(DesignatedCoachDetailsNotifier)
const designatedCoachDetailsNotifierProvider =
    DesignatedCoachDetailsNotifierFamily._();

final class DesignatedCoachDetailsNotifierProvider
    extends
        $AsyncNotifierProvider<
          DesignatedCoachDetailsNotifier,
          DesignatedCoachDetails
        > {
  const DesignatedCoachDetailsNotifierProvider._({
    required DesignatedCoachDetailsNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'designatedCoachDetailsNotifierProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$designatedCoachDetailsNotifierHash();

  @override
  String toString() {
    return r'designatedCoachDetailsNotifierProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  DesignatedCoachDetailsNotifier create() => DesignatedCoachDetailsNotifier();

  @override
  bool operator ==(Object other) {
    return other is DesignatedCoachDetailsNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$designatedCoachDetailsNotifierHash() =>
    r'892466b8382f86e2b8bc6b11c4d21529593574a9';

final class DesignatedCoachDetailsNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          DesignatedCoachDetailsNotifier,
          AsyncValue<DesignatedCoachDetails>,
          DesignatedCoachDetails,
          FutureOr<DesignatedCoachDetails>,
          int
        > {
  const DesignatedCoachDetailsNotifierFamily._()
    : super(
        retry: null,
        name: r'designatedCoachDetailsNotifierProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  DesignatedCoachDetailsNotifierProvider call(int designationId) =>
      DesignatedCoachDetailsNotifierProvider._(
        argument: designationId,
        from: this,
      );

  @override
  String toString() => r'designatedCoachDetailsNotifierProvider';
}

abstract class _$DesignatedCoachDetailsNotifier
    extends $AsyncNotifier<DesignatedCoachDetails> {
  late final _$args = ref.$arg as int;
  int get designationId => _$args;

  FutureOr<DesignatedCoachDetails> build(int designationId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref
            as $Ref<AsyncValue<DesignatedCoachDetails>, DesignatedCoachDetails>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<DesignatedCoachDetails>,
                DesignatedCoachDetails
              >,
              AsyncValue<DesignatedCoachDetails>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
