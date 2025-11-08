// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_details_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TeamDetailsNotifier)
const teamDetailsProvider = TeamDetailsNotifierFamily._();

final class TeamDetailsNotifierProvider
    extends $AsyncNotifierProvider<TeamDetailsNotifier, TeamDetails> {
  const TeamDetailsNotifierProvider._({
    required TeamDetailsNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'teamDetailsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$teamDetailsNotifierHash();

  @override
  String toString() {
    return r'teamDetailsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TeamDetailsNotifier create() => TeamDetailsNotifier();

  @override
  bool operator ==(Object other) {
    return other is TeamDetailsNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$teamDetailsNotifierHash() =>
    r'58fb3fc52097fadf0c430017676691e277a0e9dd';

final class TeamDetailsNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          TeamDetailsNotifier,
          AsyncValue<TeamDetails>,
          TeamDetails,
          FutureOr<TeamDetails>,
          int
        > {
  const TeamDetailsNotifierFamily._()
    : super(
        retry: null,
        name: r'teamDetailsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TeamDetailsNotifierProvider call(int teamId) =>
      TeamDetailsNotifierProvider._(argument: teamId, from: this);

  @override
  String toString() => r'teamDetailsProvider';
}

abstract class _$TeamDetailsNotifier extends $AsyncNotifier<TeamDetails> {
  late final _$args = ref.$arg as int;
  int get teamId => _$args;

  FutureOr<TeamDetails> build(int teamId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<TeamDetails>, TeamDetails>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<TeamDetails>, TeamDetails>,
              AsyncValue<TeamDetails>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
