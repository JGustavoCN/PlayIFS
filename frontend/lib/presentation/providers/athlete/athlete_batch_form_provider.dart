import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/di/locator.dart';
import '../../../core/network/result.dart';
import '../../../domain/entities/athlete/athlete_input.dart';
import '../../../domain/usecases/athlete/batch_insert_athletes_use_case.dart';
import 'athlete_provider.dart';

part 'athlete_batch_form_provider.g.dart';

@riverpod
class AthleteBatchForm extends _$AthleteBatchForm {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  /// Tenta registar uma lista de atletas em massa.
  /// Retorna `true` em caso de sucesso, `false` em caso de falha.
  Future<bool> batchCreateAthletes(List<AthleteInput> athletes) async {
    // Define o estado como loading para a UI poder reagir (ex: desabilitar o botão).
    state = const AsyncValue.loading();

    final useCase = locator<BatchInsertAthletesUseCase>();
    final result = await useCase.execute(athletes);

    return result.when(
      success: (_) {
        // Em caso de sucesso:
        // 1. Invalida a lista principal de atletas para que ela se atualize.
        ref.invalidate(athleteListProvider);
        // 2. Volta o estado para 'data' (não loading/error).
        state = const AsyncValue.data(null);
        // 3. Retorna true para a UI.
        return true;
      },
      failure: (err) {
        // Em caso de falha:
        // 1. Coloca este provider em estado de erro com a exceção detalhada.
        state = AsyncValue.error(err, StackTrace.current);
        // 2. Retorna false para a UI.
        return false;
      },
    );
  }
}