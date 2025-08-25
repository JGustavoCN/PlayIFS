// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_details_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(TeamDetailsNotifier)
const teamDetailsNotifierProvider = TeamDetailsNotifierFamily._();

final class TeamDetailsNotifierProvider
    extends $AsyncNotifierProvider<TeamDetailsNotifier, TeamDetails> {
  const TeamDetailsNotifierProvider._({
    required TeamDetailsNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'teamDetailsNotifierProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$teamDetailsNotifierHash();

  @override
  String toString() {
    return r'teamDetailsNotifierProvider'
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
    r'aa89a3a1d597bd8a7f68f72043a714d01e378f45';

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
        name: r'teamDetailsNotifierProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TeamDetailsNotifierProvider call(int teamId) =>
      TeamDetailsNotifierProvider._(argument: teamId, from: this);

  @override
  String toString() => r'teamDetailsNotifierProvider';
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

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
