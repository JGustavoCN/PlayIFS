import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/di/locator.dart';
import '../../../core/network/result.dart';
import '../../../domain/entities/athlete/athlete_details.dart';
import '../../../domain/entities/athlete/athlete_input.dart';
import '../../../domain/entities/athlete/athlete_update.dart';
import '../../../domain/usecases/athlete/insert_athlete_use_case.dart';
import '../../../domain/usecases/athlete/update_athlete_use_case.dart';
import 'athlete_provider.dart';

part 'athlete_form_provider.g.dart';

@riverpod
class AthleteForm extends _$AthleteForm {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<bool> createAthlete(AthleteInput data) async {
    state = const AsyncValue.loading();
    final insert = locator<InsertAthleteUseCase>();
    final result = await insert.execute(data);

    return result.when(
      success: (_) {
        ref.invalidate(athleteListProvider);
        state = const AsyncValue.data(null);
        return true;
      },
      failure: (err) {
        state = AsyncValue.error(err, StackTrace.current);
        return false;
      },
    );
  }

  Future<bool> updateAthlete(int id, AthleteUpdate data) async {
    state = const AsyncValue.loading();
    final update = locator<UpdateAthleteUseCase>();

    // O UpdateAthleteUseCase precisa retornar o AthleteDetails atualizado.
    // A sua camada de dados já faz isso.
    final Result<AthleteDetails> result = await update.execute(id, data);

    return result.when(
      success: (updated) {
        ref.invalidate(athleteListProvider);
        // A invalidação dos detalhes é importante para a própria tela de edição.
        ref.invalidate(athleteDetailsProvider(id));
        state = const AsyncValue.data(null);
        return true;
      },
      failure: (err) {
        state = AsyncValue.error(err, StackTrace.current);
        return false;
      },
    );
  }
}