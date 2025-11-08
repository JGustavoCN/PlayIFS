// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teams_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TeamsNotifier)
const teamsProvider = TeamsNotifierFamily._();

final class TeamsNotifierProvider
    extends $AsyncNotifierProvider<TeamsNotifier, Page<TeamSummary>> {
  const TeamsNotifierProvider._({
    required TeamsNotifierFamily super.from,
    required int? super.argument,
  }) : super(
         retry: null,
         name: r'teamsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$teamsNotifierHash();

  @override
  String toString() {
    return r'teamsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TeamsNotifier create() => TeamsNotifier();

  @override
  bool operator ==(Object other) {
    return other is TeamsNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$teamsNotifierHash() => r'09f8b4449808e9875c3f9b3f70a7ab070ada854b';

final class TeamsNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          TeamsNotifier,
          AsyncValue<Page<TeamSummary>>,
          Page<TeamSummary>,
          FutureOr<Page<TeamSummary>>,
          int?
        > {
  const TeamsNotifierFamily._()
    : super(
        retry: null,
        name: r'teamsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TeamsNotifierProvider call({int? competitionId}) =>
      TeamsNotifierProvider._(argument: competitionId, from: this);

  @override
  String toString() => r'teamsProvider';
}

abstract class _$TeamsNotifier extends $AsyncNotifier<Page<TeamSummary>> {
  late final _$args = ref.$arg as int?;
  int? get competitionId => _$args;

  FutureOr<Page<TeamSummary>> build({int? competitionId});
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(competitionId: _$args);
    final ref =
        this.ref as $Ref<AsyncValue<Page<TeamSummary>>, Page<TeamSummary>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Page<TeamSummary>>, Page<TeamSummary>>,
              AsyncValue<Page<TeamSummary>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
