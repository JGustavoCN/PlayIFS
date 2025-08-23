// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'competition_form_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(CompetitionFormNotifier)
const competitionFormNotifierProvider = CompetitionFormNotifierProvider._();

final class CompetitionFormNotifierProvider
    extends $NotifierProvider<CompetitionFormNotifier, CompetitionFormState> {
  const CompetitionFormNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'competitionFormNotifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$competitionFormNotifierHash();

  @$internal
  @override
  CompetitionFormNotifier create() => CompetitionFormNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CompetitionFormState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CompetitionFormState>(value),
    );
  }
}

String _$competitionFormNotifierHash() =>
    r'93790b0cf642f14b177d41649fbf09d713bed48d';

abstract class _$CompetitionFormNotifier
    extends $Notifier<CompetitionFormState> {
  CompetitionFormState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<CompetitionFormState, CompetitionFormState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CompetitionFormState, CompetitionFormState>,
              CompetitionFormState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
