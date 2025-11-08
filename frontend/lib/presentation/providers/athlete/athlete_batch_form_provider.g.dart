// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'athlete_batch_form_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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

String _$athleteBatchFormHash() => r'c88cbc5f25f7cdc014881d2f0b91f33e3ab0c994';

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
