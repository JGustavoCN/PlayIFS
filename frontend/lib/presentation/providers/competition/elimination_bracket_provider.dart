import 'package:playifs_frontend/core/di/locator.dart';
import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/competition/elimination_bracket.dart';
import 'package:playifs_frontend/domain/usecases/competition/generate_elimination_stage_use_case.dart';
import 'package:playifs_frontend/domain/usecases/competition/get_elimination_bracket_use_case.dart';
import 'package:playifs_frontend/presentation/providers/competition/stage_providers_params.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'elimination_bracket_provider.g.dart';

@riverpod
class EliminationBracketNotifier extends _$EliminationBracketNotifier {
  @override
  Future<EliminationBracket> build(StageProvidersParams params) async {
    final useCase = locator<GetEliminationBracketUseCase>();
    final result = await useCase.execute(
      competitionId: params.competitionId,
      sportId: params.sportId,
    );

    return switch (result) {
      Success(data: final bracket) => bracket,
    // CORREÇÃO: A propriedade é 'error', não 'exception'.
      Failure(error: final e) => throw e,
    };
  }

  Future<void> generateEliminationStage() async {
    final params = this.params;
    final useCase = locator<GenerateEliminationStageUseCase>();
    state = const AsyncValue.loading();
    final result = await useCase.execute(
      competitionId: params.competitionId,
      sportId: params.sportId,
    );

    result.when(
      success: (_) => ref.invalidateSelf(),
      // 'when' usa o nome do parâmetro, então 'error' aqui também.
      failure: (error) => state = AsyncValue.error(error, StackTrace.current),
    );
  }
}