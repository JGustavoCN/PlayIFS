import 'package:playifs_frontend/core/di/locator.dart';
import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/competition/group_stage_view.dart';
import 'package:playifs_frontend/domain/usecases/competition/generate_group_stage_use_case.dart';
import 'package:playifs_frontend/domain/usecases/competition/get_group_stage_view_use_case.dart';
import 'package:playifs_frontend/presentation/providers/competition/stage_providers_params.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'group_stage_view_provider.g.dart';

@riverpod
class GroupStageViewNotifier extends _$GroupStageViewNotifier {
  @override
  Future<GroupStageView> build(StageProvidersParams params) async {
    final useCase = locator<GetGroupStageViewUseCase>();
    final result = await useCase.execute(
      competitionId: params.competitionId,
      sportId: params.sportId,
    );

    return switch (result) {
      Success(data: final view) => view,
    // CORREÇÃO: A propriedade é 'error', não 'exception'.
      Failure(error: final e) => throw e,
    };
  }

  Future<void> generateGroupStage() async {
    final params = this.params;
    final useCase = locator<GenerateGroupStageUseCase>();
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