import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/di/locator.dart';
import '../../../core/network/result.dart';
import '../../../domain/entities/athlete/athlete_details.dart';
import '../../../domain/entities/athlete/athlete_summary.dart';
import '../../../domain/entities/shared/page.dart';
import '../../../domain/usecases/athlete/batch_delete_athletes_use_case.dart';
import '../../../domain/usecases/athlete/delete_athlete_use_case.dart';
import '../../../domain/usecases/athlete/find_all_athletes_use_case.dart';
import '../../../domain/usecases/athlete/find_athlete_by_id_use_case.dart';

part 'athlete_provider.g.dart';

@riverpod
class AthleteSearchQuery extends _$AthleteSearchQuery {
  @override
  String build() => '';

  void setSearchQuery(String query) {
    state = query;
  }
}

@riverpod
class AthleteList extends _$AthleteList {
  @override
  Future<Page<AthleteSummary>> build() async {
    final searchQuery = ref.watch(athleteSearchQueryProvider);
    final findAllAthletes = locator<FindAllAthletesUseCase>();
    final result = await findAllAthletes.execute(name: searchQuery);

    return result.when(
      success: (page) => page,
      failure: (err) => throw err,
    );
  }

  Future<void> fetchNextPage() async {
    final currentState = state.asData?.value;
    if (currentState == null ||
        currentState.number >= currentState.totalPages - 1) {
      return;
    }

    final findAllAthletes = locator<FindAllAthletesUseCase>();
    final searchQuery = ref.read(athleteSearchQueryProvider);
    final nextPage = currentState.number + 1;

    final result = await findAllAthletes.execute(
      page: nextPage,
      name: searchQuery,
    );

    result.when(
      success: (newPage) {
        state = AsyncValue.data(
          newPage.copyWith(
            content: [...currentState.content, ...newPage.content],
          ),
        );
      },
      failure: (err) => throw err,
    );
  }

  Future<void> deleteAthlete(int athleteId) async {
    final deleteAthleteUseCase = locator<DeleteAthleteUseCase>();
    final result = await deleteAthleteUseCase.execute(athleteId);

    result.when(
      success: (_) => ref.invalidateSelf(),
      failure: (err) => throw err,
    );
  }

  // ✅ CORREÇÃO: Método duplicado removido e 'return' apagado.
  Future<void> batchDeleteAthletes(List<int> ids) async {
    final batchDeleteUseCase = locator<BatchDeleteAthletesUseCase>();
    final result = await batchDeleteUseCase.execute(ids);

    result.when(
      success: (_) => ref.invalidateSelf(),
      failure: (err) => throw err,
    );
  }
}

@riverpod
Future<AthleteDetails> athleteDetails(
    Ref ref,
    int athleteId,
    ) async {
  final findByIdUseCase = locator<FindAthleteByIdUseCase>();
  final result = await findByIdUseCase.execute(athleteId);
  return result.when(
    success: (athlete) => athlete,
    failure: (err) => throw err,
  );
}