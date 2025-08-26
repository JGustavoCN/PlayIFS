// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_stage_view_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(GroupStageViewNotifier)
const groupStageViewNotifierProvider = GroupStageViewNotifierFamily._();

final class GroupStageViewNotifierProvider
    extends $AsyncNotifierProvider<GroupStageViewNotifier, GroupStageView> {
  const GroupStageViewNotifierProvider._({
    required GroupStageViewNotifierFamily super.from,
    required StageProvidersParams super.argument,
  }) : super(
         retry: null,
         name: r'groupStageViewNotifierProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$groupStageViewNotifierHash();

  @override
  String toString() {
    return r'groupStageViewNotifierProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  GroupStageViewNotifier create() => GroupStageViewNotifier();

  @override
  bool operator ==(Object other) {
    return other is GroupStageViewNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$groupStageViewNotifierHash() =>
    r'12bac1bd36792577721a64874ac0e4b8f38271e4';

final class GroupStageViewNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          GroupStageViewNotifier,
          AsyncValue<GroupStageView>,
          GroupStageView,
          FutureOr<GroupStageView>,
          StageProvidersParams
        > {
  const GroupStageViewNotifierFamily._()
    : super(
        retry: null,
        name: r'groupStageViewNotifierProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GroupStageViewNotifierProvider call(StageProvidersParams params) =>
      GroupStageViewNotifierProvider._(argument: params, from: this);

  @override
  String toString() => r'groupStageViewNotifierProvider';
}

abstract class _$GroupStageViewNotifier extends $AsyncNotifier<GroupStageView> {
  late final _$args = ref.$arg as StageProvidersParams;
  StageProvidersParams get params => _$args;

  FutureOr<GroupStageView> build(StageProvidersParams params);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<GroupStageView>, GroupStageView>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<GroupStageView>, GroupStageView>,
              AsyncValue<GroupStageView>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
