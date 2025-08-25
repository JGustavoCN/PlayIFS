// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_form_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(TeamFormNotifier)
const teamFormNotifierProvider = TeamFormNotifierFamily._();

final class TeamFormNotifierProvider
    extends $NotifierProvider<TeamFormNotifier, AsyncValue<void>> {
  const TeamFormNotifierProvider._({
    required TeamFormNotifierFamily super.from,
    required TeamDetails? super.argument,
  }) : super(
         retry: null,
         name: r'teamFormNotifierProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$teamFormNotifierHash();

  @override
  String toString() {
    return r'teamFormNotifierProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TeamFormNotifier create() => TeamFormNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TeamFormNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$teamFormNotifierHash() => r'df45ed53debb8fb2353090d5e3e7a7c2ae8a04eb';

final class TeamFormNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          TeamFormNotifier,
          AsyncValue<void>,
          AsyncValue<void>,
          AsyncValue<void>,
          TeamDetails?
        > {
  const TeamFormNotifierFamily._()
    : super(
        retry: null,
        name: r'teamFormNotifierProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TeamFormNotifierProvider call({TeamDetails? initialTeam}) =>
      TeamFormNotifierProvider._(argument: initialTeam, from: this);

  @override
  String toString() => r'teamFormNotifierProvider';
}

abstract class _$TeamFormNotifier extends $Notifier<AsyncValue<void>> {
  late final _$args = ref.$arg as TeamDetails?;
  TeamDetails? get initialTeam => _$args;

  AsyncValue<void> build({TeamDetails? initialTeam});
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(initialTeam: _$args);
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
