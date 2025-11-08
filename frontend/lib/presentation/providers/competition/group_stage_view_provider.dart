import 'package:playifs_frontend/core/di/locator.dart';
import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/competition/group_stage_view.dart';
import 'package:playifs_frontend/domain/usecases/competition/generate_group_stage_use_case.dart';
import 'package:playifs_frontend/domain/usecases/competition/get_group_stage_view_use_case.dart';
import 'package:playifs_frontend/presentation/providers/competition/stage_providers_params.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'group_stage_view_provider.g.dart';

@Riverpod(keepAlive: true) // ✅ impede o descarte automático (corrige o loop de 404)
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
      Failure(error: final e) => throw e,
    };
  }

  Future<void> generateGroupStage() async {
    final params = this.params;
    final useCase = locator<GenerateGroupStageUseCase>();
    state = const AsyncLoading();

    final result = await useCase.execute(
      competitionId: params.competitionId,
      sportId: params.sportId,
    );

    result.when(
      success: (_) => ref.invalidateSelf(), // recarrega a fase após gerar
      failure: (error) =>
      state = AsyncValue.error(error, StackTrace.current),
    );
  }
}
