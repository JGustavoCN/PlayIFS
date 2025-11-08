// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'competition_details_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CompetitionDetailsNotifier)
const competitionDetailsProvider = CompetitionDetailsNotifierFamily._();

final class CompetitionDetailsNotifierProvider
    extends
        $AsyncNotifierProvider<CompetitionDetailsNotifier, CompetitionDetails> {
  const CompetitionDetailsNotifierProvider._({
    required CompetitionDetailsNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'competitionDetailsProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$competitionDetailsNotifierHash();

  @override
  String toString() {
    return r'competitionDetailsProvider'
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
        name: r'competitionDetailsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  CompetitionDetailsNotifierProvider call(int competitionId) =>
      CompetitionDetailsNotifierProvider._(argument: competitionId, from: this);

  @override
  String toString() => r'competitionDetailsProvider';
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
