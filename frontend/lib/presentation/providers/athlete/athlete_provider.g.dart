// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'athlete_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(AthleteSearchQuery)
const athleteSearchQueryProvider = AthleteSearchQueryProvider._();

final class AthleteSearchQueryProvider
    extends $NotifierProvider<AthleteSearchQuery, String> {
  const AthleteSearchQueryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'athleteSearchQueryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$athleteSearchQueryHash();

  @$internal
  @override
  AthleteSearchQuery create() => AthleteSearchQuery();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$athleteSearchQueryHash() =>
    r'74afa7ef1d3a59f1d673ef9c7f30fb79b1fb6176';

abstract class _$AthleteSearchQuery extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(AthleteList)
const athleteListProvider = AthleteListProvider._();

final class AthleteListProvider
    extends $AsyncNotifierProvider<AthleteList, Page<AthleteSummary>> {
  const AthleteListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'athleteListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$athleteListHash();

  @$internal
  @override
  AthleteList create() => AthleteList();
}

String _$athleteListHash() => r'c9984ede2d4956e9cad30271e0c61126249ccb1f';

abstract class _$AthleteList extends $AsyncNotifier<Page<AthleteSummary>> {
  FutureOr<Page<AthleteSummary>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<AsyncValue<Page<AthleteSummary>>, Page<AthleteSummary>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<Page<AthleteSummary>>,
                Page<AthleteSummary>
              >,
              AsyncValue<Page<AthleteSummary>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(athleteDetails)
const athleteDetailsProvider = AthleteDetailsFamily._();

final class AthleteDetailsProvider
    extends
        $FunctionalProvider<
          AsyncValue<AthleteDetails>,
          AthleteDetails,
          FutureOr<AthleteDetails>
        >
    with $FutureModifier<AthleteDetails>, $FutureProvider<AthleteDetails> {
  const AthleteDetailsProvider._({
    required AthleteDetailsFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'athleteDetailsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$athleteDetailsHash();

  @override
  String toString() {
    return r'athleteDetailsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<AthleteDetails> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AthleteDetails> create(Ref ref) {
    final argument = this.argument as int;
    return athleteDetails(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is AthleteDetailsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$athleteDetailsHash() => r'4e6fcd1260d232ee69224723c08b3e4d0be5fda8';

final class AthleteDetailsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<AthleteDetails>, int> {
  const AthleteDetailsFamily._()
    : super(
        retry: null,
        name: r'athleteDetailsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AthleteDetailsProvider call(int athleteId) =>
      AthleteDetailsProvider._(argument: athleteId, from: this);

  @override
  String toString() => r'athleteDetailsProvider';
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
