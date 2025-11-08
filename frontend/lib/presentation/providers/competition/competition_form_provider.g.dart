// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'competition_form_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CompetitionFormNotifier)
const competitionFormProvider = CompetitionFormNotifierProvider._();

final class CompetitionFormNotifierProvider
    extends $NotifierProvider<CompetitionFormNotifier, CompetitionFormState> {
  const CompetitionFormNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'competitionFormProvider',
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
    r'8bdc746b5f7423327a46b43e80c7e0ffd2f8aa94';

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
