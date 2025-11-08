// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'designated_coach_form_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DesignatedCoachFormNotifier)
const designatedCoachFormProvider = DesignatedCoachFormNotifierProvider._();

final class DesignatedCoachFormNotifierProvider
    extends
        $NotifierProvider<
          DesignatedCoachFormNotifier,
          DesignatedCoachFormState
        > {
  const DesignatedCoachFormNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'designatedCoachFormProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$designatedCoachFormNotifierHash();

  @$internal
  @override
  DesignatedCoachFormNotifier create() => DesignatedCoachFormNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DesignatedCoachFormState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DesignatedCoachFormState>(value),
    );
  }
}

String _$designatedCoachFormNotifierHash() =>
    r'6b251570fed61528f0659ea1aa0afe310d58ccc2';

abstract class _$DesignatedCoachFormNotifier
    extends $Notifier<DesignatedCoachFormState> {
  DesignatedCoachFormState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<DesignatedCoachFormState, DesignatedCoachFormState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DesignatedCoachFormState, DesignatedCoachFormState>,
              DesignatedCoachFormState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
