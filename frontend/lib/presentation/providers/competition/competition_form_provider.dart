// Ficheiro: lib/presentation/providers/competition/competition_form_provider.dart

import 'package:playifs_frontend/core/di/locator.dart';
import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/competition/competition_input.dart';
import 'package:playifs_frontend/domain/usecases/competition/delete_competition_use_case.dart';
import 'package:playifs_frontend/domain/usecases/competition/insert_competition_use_case.dart';
import 'package:playifs_frontend/domain/usecases/competition/update_competition_use_case.dart';
import 'package:playifs_frontend/presentation/providers/competition/competition_details_provider.dart';
import 'package:playifs_frontend/presentation/providers/competition/competitions_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'competition_form_state.dart';

part 'competition_form_provider.g.dart';

@riverpod
class CompetitionFormNotifier extends _$CompetitionFormNotifier {
  late final InsertCompetitionUseCase _insertUseCase = locator<InsertCompetitionUseCase>();
  late final UpdateCompetitionUseCase _updateUseCase = locator<UpdateCompetitionUseCase>();
  late final DeleteCompetitionUseCase _deleteUseCase = locator<DeleteCompetitionUseCase>();

  @override
  CompetitionFormState build() => const CompetitionFormState.initial();

  void reset() {
    state = const CompetitionFormState.initial();
  }

  Future<void> create(CompetitionInput input) async {
    state = const CompetitionFormState.loading();
    final result = await _insertUseCase.execute(input);
    state = result.when(
      success: (competition) {
        ref.invalidate(competitionsNotifierProvider);
        return CompetitionFormState.success(competition);
      },
      failure: (error) => CompetitionFormState.failure(error),
    );
  }

  Future<void> update(int id, CompetitionInput input) async {
    state = const CompetitionFormState.loading();
    final result = await _updateUseCase.execute(id, input);
    state = result.when(
      success: (competition) {
        ref.invalidate(competitionsNotifierProvider);
        ref.invalidate(competitionDetailsNotifierProvider(id));
        return CompetitionFormState.success(competition);
      },
      failure: (error) => CompetitionFormState.failure(error),
    );
  }

  Future<void> delete(int id) async {
    state = const CompetitionFormState.loading();
    final result = await _deleteUseCase.execute(id);
    state = result.when(
      success: (_) {
        ref.invalidate(competitionsNotifierProvider);
        // ✅ CORREÇÃO: Usando o novo estado específico para o sucesso da exclusão.
        return const CompetitionFormState.deleteSuccess();
      },
      failure: (error) => CompetitionFormState.failure(error),
    );
  }
}