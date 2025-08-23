// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'competition_details_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(CompetitionDetailsNotifier)
const competitionDetailsNotifierProvider = CompetitionDetailsNotifierFamily._();

final class CompetitionDetailsNotifierProvider
    extends
        $AsyncNotifierProvider<CompetitionDetailsNotifier, CompetitionDetails> {
  const CompetitionDetailsNotifierProvider._({
    required CompetitionDetailsNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'competitionDetailsNotifierProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$competitionDetailsNotifierHash();

  @override
  String toString() {
    return r'competitionDetailsNotifierProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CompetitionDetailsNotifier create() => CompetitionDetailsNotifier();

  @override
  bool operator ==(Object other) {
    return other is CompetitionDetailsNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$competitionDetailsNotifierHash() =>
    r'f88d07b59329b9c83ece8978cebb34bcf6b031bc';

final class CompetitionDetailsNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          CompetitionDetailsNotifier,
          AsyncValue<CompetitionDetails>,
          CompetitionDetails,
          FutureOr<CompetitionDetails>,
          int
        > {
  const CompetitionDetailsNotifierFamily._()
    : super(
        retry: null,
        name: r'competitionDetailsNotifierProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  CompetitionDetailsNotifierProvider call(int competitionId) =>
      CompetitionDetailsNotifierProvider._(argument: competitionId, from: this);

  @override
  String toString() => r'competitionDetailsNotifierProvider';
}

abstract class _$CompetitionDetailsNotifier
    extends $AsyncNotifier<CompetitionDetails> {
  late final _$args = ref.$arg as int;
  int get competitionId => _$args;

  FutureOr<CompetitionDetails> build(int competitionId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref as $Ref<AsyncValue<CompetitionDetails>, CompetitionDetails>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<CompetitionDetails>, CompetitionDetails>,
              AsyncValue<CompetitionDetails>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
