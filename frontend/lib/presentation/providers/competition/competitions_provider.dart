// Ficheiro: lib/presentation/providers/competition/competitions_provider.dart

import 'dart:async';

import 'package:playifs_frontend/core/di/locator.dart';
import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/competition/competition_summary.dart';
import 'package:playifs_frontend/domain/entities/shared/page.dart';
import 'package:playifs_frontend/domain/usecases/competition/find_all_competitions_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'competitions_provider.g.dart';

@riverpod
class CompetitionsNotifier extends _$CompetitionsNotifier {
  late final FindAllCompetitionsUseCase _findAllUseCase = locator<FindAllCompetitionsUseCase>();

  @override
  Future<Page<CompetitionSummary>> build() => _fetchPage(0);

  Future<Page<CompetitionSummary>> _fetchPage(
      int page, {
        Map<String, dynamic>? filters,
      }) async {
    final result = await _findAllUseCase.execute(
      page: page,
      filters: filters,
    );
    return result.when(
      success: (data) => data,
      failure: (error) => throw error,
    );
  }

  Future<void> loadNextPage() async {
    if (state.isLoading || !state.hasValue) return;

    final currentPage = state.value!;
    if (currentPage.number >= currentPage.totalPages - 1) return;

    final nextPageData = await _fetchPage(currentPage.number + 1);

    state = AsyncData(
      currentPage.copyWith(
        content: [...currentPage.content, ...nextPageData.content],
        number: nextPageData.number,
      ),
    );
  }
}