import 'dart:async';

import 'package:playifs_frontend/core/di/locator.dart';
import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/designated_coach/designated_coach_summary.dart';
import 'package:playifs_frontend/domain/entities/shared/page.dart';
import 'package:playifs_frontend/domain/usecases/designated_coach/find_all_designated_coaches_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'designated_coaches_provider.g.dart';

@riverpod
class DesignatedCoachesNotifier extends _$DesignatedCoachesNotifier {
  final _findAllUseCase = locator<FindAllDesignatedCoachesUseCase>();
  String _currentSearchTerm = '';

  @override
  Future<Page<DesignatedCoachSummary>> build(int competitionId) async {
    final result = await _fetchPage(page: 0, competitionId: competitionId);
    return result.when(
      success: (page) => page,
      failure: (error) => throw error,
    );
  }

  Future<Result<Page<DesignatedCoachSummary>>> _fetchPage({
    required int page,
    required int competitionId,
    String? athleteName,
  }) =>
      // ✅ CORREÇÃO: Chamando o método '.execute()' explicitamente.
  _findAllUseCase.execute(
    page: page,
    competitionId: competitionId,
    athleteName: athleteName?.isEmpty ?? true ? null : athleteName,
  );

  Future<void> fetchNextPage() async {
    final currentState = state.value;
    if (currentState == null || (currentState.number >= currentState.totalPages - 1)) {
      return;
    }

    final nextPage = currentState.number + 1;
    final result = await _fetchPage(
      page: nextPage,
      competitionId: competitionId,
      athleteName: _currentSearchTerm,
    );

    result.when(
      success: (newPage) {
        final combinedList = [...currentState.content, ...newPage.content];
        state = AsyncData(newPage.copyWith(content: combinedList));
      },
      failure: (error) { /* Tratar erro de paginação se necessário */ },
    );
  }

  Future<void> searchByName(String name) async {
    _currentSearchTerm = name;
    state = const AsyncLoading();

    final result = await _fetchPage(
      page: 0,
      competitionId: competitionId,
      athleteName: name,
    );

    state = result.when(
      success: (page) => AsyncData(page),
      failure: (error) => AsyncError(error, StackTrace.current),
    );
  }
}