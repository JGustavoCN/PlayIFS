// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'athlete_batch_form_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(AthleteBatchForm)
const athleteBatchFormProvider = AthleteBatchFormProvider._();

final class AthleteBatchFormProvider
    extends $NotifierProvider<AthleteBatchForm, AsyncValue<void>> {
  const AthleteBatchFormProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'athleteBatchFormProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$athleteBatchFormHash();

  @$internal
  @override
  AthleteBatchForm create() => AthleteBatchForm();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$athleteBatchFormHash() => r'332010d49bf4efffbabf299416f3f2a06526b141';

abstract class _$AthleteBatchForm extends $Notifier<AsyncValue<void>> {
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
