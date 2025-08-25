// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'designated_coaches_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(DesignatedCoachesNotifier)
const designatedCoachesNotifierProvider = DesignatedCoachesNotifierFamily._();

final class DesignatedCoachesNotifierProvider
    extends
        $AsyncNotifierProvider<
          DesignatedCoachesNotifier,
          Page<DesignatedCoachSummary>
        > {
  const DesignatedCoachesNotifierProvider._({
    required DesignatedCoachesNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'designatedCoachesNotifierProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$designatedCoachesNotifierHash();

  @override
  String toString() {
    return r'designatedCoachesNotifierProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  DesignatedCoachesNotifier create() => DesignatedCoachesNotifier();

  @override
  bool operator ==(Object other) {
    return other is DesignatedCoachesNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$designatedCoachesNotifierHash() =>
    r'248655d7fc4cdc36a6de84e995a01df030b1a964';

final class DesignatedCoachesNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          DesignatedCoachesNotifier,
          AsyncValue<Page<DesignatedCoachSummary>>,
          Page<DesignatedCoachSummary>,
          FutureOr<Page<DesignatedCoachSummary>>,
          int
        > {
  const DesignatedCoachesNotifierFamily._()
    : super(
        retry: null,
        name: r'designatedCoachesNotifierProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DesignatedCoachesNotifierProvider call(int competitionId) =>
      DesignatedCoachesNotifierProvider._(argument: competitionId, from: this);

  @override
  String toString() => r'designatedCoachesNotifierProvider';
}

abstract class _$DesignatedCoachesNotifier
    extends $AsyncNotifier<Page<DesignatedCoachSummary>> {
  late final _$args = ref.$arg as int;
  int get competitionId => _$args;

  FutureOr<Page<DesignatedCoachSummary>> build(int competitionId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref
            as $Ref<
              AsyncValue<Page<DesignatedCoachSummary>>,
              Page<DesignatedCoachSummary>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<Page<DesignatedCoachSummary>>,
                Page<DesignatedCoachSummary>
              >,
              AsyncValue<Page<DesignatedCoachSummary>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
