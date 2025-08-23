// Ficheiro: lib/presentation/providers/designated_coach/designated_coach_form_provider.dart

import 'package:playifs_frontend/core/di/locator.dart';
import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/designated_coach/designated_coach_input.dart';
import 'package:playifs_frontend/domain/entities/designated_coach/designated_coach_input_batch.dart';
import 'package:playifs_frontend/domain/usecases/designated_coach/batch_remove_coaches_use_case.dart';
import 'package:playifs_frontend/domain/usecases/designated_coach/batch_upsert_coaches_use_case.dart';
import 'package:playifs_frontend/domain/usecases/designated_coach/define_coach_use_case.dart';
import 'package:playifs_frontend/domain/usecases/designated_coach/update_coach_use_case.dart';
import 'package:playifs_frontend/presentation/providers/designated_coach/designated_coaches_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'designated_coach_form_state.dart';

part 'designated_coach_form_provider.g.dart';

@riverpod
class DesignatedCoachFormNotifier extends _$DesignatedCoachFormNotifier {
  late final DefineCoachUseCase _defineUseCase = locator<DefineCoachUseCase>();
  late final UpdateCoachUseCase _updateUseCase = locator<UpdateCoachUseCase>();
  late final BatchUpsertCoachesUseCase _batchUpsertUseCase = locator<BatchUpsertCoachesUseCase>();
  late final BatchRemoveCoachesUseCase _batchRemoveUseCase = locator<BatchRemoveCoachesUseCase>();

  @override
  DesignatedCoachFormState build() => const DesignatedCoachFormState.initial();

  void reset() {
    state = const DesignatedCoachFormState.initial();
  }

  // ✅ CORREÇÃO: Métodos agora retornam 'Future<bool>'.
  Future<bool> define(DesignatedCoachInput input) async {
    state = const DesignatedCoachFormState.loading();
    final result = await _defineUseCase.execute(input);
    state = result.when(
      success: (_) {
        ref.invalidate(designatedCoachesNotifierProvider(input.competitionId));
        return const DesignatedCoachFormState.success();
      },
      failure: (error) => DesignatedCoachFormState.failure(error),
    );
    return result.when(success: (_) => true, failure: (_) => false);
  }

  Future<bool> update(DesignatedCoachInput input) async {
    state = const DesignatedCoachFormState.loading();
    final result = await _updateUseCase.execute(input);
    state = result.when(
      success: (_) {
        ref.invalidate(designatedCoachesNotifierProvider(input.competitionId));
        return const DesignatedCoachFormState.success();
      },
      failure: (error) => DesignatedCoachFormState.failure(error),
    );
    return result.when(success: (_) => true, failure: (_) => false);
  }

  Future<bool> batchUpsert(DesignatedCoachInputBatch batch, int competitionId) async {
    state = const DesignatedCoachFormState.loading();
    final result = await _batchUpsertUseCase.execute(batch);
    state = result.when(
      success: (_) {
        ref.invalidate(designatedCoachesNotifierProvider(competitionId));
        return const DesignatedCoachFormState.success();
      },
      failure: (error) => DesignatedCoachFormState.failure(error),
    );
    return result.when(success: (_) => true, failure: (_) => false);
  }

  Future<bool> removeById(int designationId, int competitionId) async {
    state = const DesignatedCoachFormState.loading();
    final result = await _batchRemoveUseCase.execute([designationId]);
    state = result.when(
      success: (_) {
        ref.invalidate(designatedCoachesNotifierProvider(competitionId));
        return const DesignatedCoachFormState.success();
      },
      failure: (error) => DesignatedCoachFormState.failure(error),
    );
    return result.when(success: (_) => true, failure: (_) => false);
  }
}