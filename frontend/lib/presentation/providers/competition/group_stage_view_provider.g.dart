// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_stage_view_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GroupStageViewNotifier)
const groupStageViewProvider = GroupStageViewNotifierFamily._();

final class GroupStageViewNotifierProvider
    extends $AsyncNotifierProvider<GroupStageViewNotifier, GroupStageView> {
  const GroupStageViewNotifierProvider._({
    required GroupStageViewNotifierFamily super.from,
    required StageProvidersParams super.argument,
  }) : super(
         retry: null,
         name: r'groupStageViewProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$groupStageViewNotifierHash();

  @override
  String toString() {
    return r'groupStageViewProvider'
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
    r'0d01f7cfd4bcd21e86d4dc637dde26f5e4df1583';

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
        name: r'groupStageViewProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  GroupStageViewNotifierProvider call(StageProvidersParams params) =>
      GroupStageViewNotifierProvider._(argument: params, from: this);

  @override
  String toString() => r'groupStageViewProvider';
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
