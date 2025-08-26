// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'elimination_bracket_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(EliminationBracketNotifier)
const eliminationBracketNotifierProvider = EliminationBracketNotifierFamily._();

final class EliminationBracketNotifierProvider
    extends
        $AsyncNotifierProvider<EliminationBracketNotifier, EliminationBracket> {
  const EliminationBracketNotifierProvider._({
    required EliminationBracketNotifierFamily super.from,
    required StageProvidersParams super.argument,
  }) : super(
         retry: null,
         name: r'eliminationBracketNotifierProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$eliminationBracketNotifierHash();

  @override
  String toString() {
    return r'eliminationBracketNotifierProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  EliminationBracketNotifier create() => EliminationBracketNotifier();

  @override
  bool operator ==(Object other) {
    return other is EliminationBracketNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$eliminationBracketNotifierHash() =>
    r'b4b95685e295468f3fe4ef53f1da12dba249bd12';

final class EliminationBracketNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          EliminationBracketNotifier,
          AsyncValue<EliminationBracket>,
          EliminationBracket,
          FutureOr<EliminationBracket>,
          StageProvidersParams
        > {
  const EliminationBracketNotifierFamily._()
    : super(
        retry: null,
        name: r'eliminationBracketNotifierProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  EliminationBracketNotifierProvider call(StageProvidersParams params) =>
      EliminationBracketNotifierProvider._(argument: params, from: this);

  @override
  String toString() => r'eliminationBracketNotifierProvider';
}

abstract class _$EliminationBracketNotifier
    extends $AsyncNotifier<EliminationBracket> {
  late final _$args = ref.$arg as StageProvidersParams;
  StageProvidersParams get params => _$args;

  FutureOr<EliminationBracket> build(StageProvidersParams params);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref as $Ref<AsyncValue<EliminationBracket>, EliminationBracket>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<EliminationBracket>, EliminationBracket>,
              AsyncValue<EliminationBracket>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
