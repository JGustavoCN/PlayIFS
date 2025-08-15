// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'athlete_form_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(AthleteForm)
const athleteFormProvider = AthleteFormProvider._();

final class AthleteFormProvider
    extends $NotifierProvider<AthleteForm, AsyncValue<void>> {
  const AthleteFormProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'athleteFormProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$athleteFormHash();

  @$internal
  @override
  AthleteForm create() => AthleteForm();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$athleteFormHash() => r'3a1f95063ea4c9a7ecc60fcf14cfedc008d04322';

abstract class _$AthleteForm extends $Notifier<AsyncValue<void>> {
  AsyncValue<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<void>, AsyncValue<void>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, AsyncValue<void>>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
