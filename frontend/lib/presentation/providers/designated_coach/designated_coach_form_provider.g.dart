// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'designated_coach_form_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(DesignatedCoachFormNotifier)
const designatedCoachFormNotifierProvider =
    DesignatedCoachFormNotifierProvider._();

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
        name: r'designatedCoachFormNotifierProvider',
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
    r'e660dce1a50dc00ecf018d6e4cfce846b2d5953a';

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

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
