// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'elimination_bracket_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(EliminationBracketNotifier)
const eliminationBracketProvider = EliminationBracketNotifierFamily._();

final class EliminationBracketNotifierProvider
    extends
        $AsyncNotifierProvider<EliminationBracketNotifier, EliminationBracket> {
  const EliminationBracketNotifierProvider._({
    required EliminationBracketNotifierFamily super.from,
    required StageProvidersParams super.argument,
  }) : super(
         retry: null,
         name: r'eliminationBracketProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$eliminationBracketNotifierHash();

  @override
  String toString() {
    return r'eliminationBracketProvider'
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
    r'9ea1ad544facc640ff6eabd300b35dfa408b52c9';

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
        name: r'eliminationBracketProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  EliminationBracketNotifierProvider call(StageProvidersParams params) =>
      EliminationBracketNotifierProvider._(argument: params, from: this);

  @override
  String toString() => r'eliminationBracketProvider';
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
