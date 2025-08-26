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
  final FindAllCompetitionsUseCase _findAllUseCase =
  locator<FindAllCompetitionsUseCase>();

  String? _nameFilter;
  String? _levelFilter;

  @override
  Future<Page<CompetitionSummary>> build() {
    return _fetchPage(0);
  }

  Future<Page<CompetitionSummary>> _fetchPage(int page) async {
    final result = await _findAllUseCase.execute(
      page: page,
      name: _nameFilter,
      level: _levelFilter,
    );

    return switch (result) {
      Success(data: final pageData) => pageData,
    // CORREÇÃO: A propriedade é 'error', não 'exception'.
      Failure(error: final e) => throw e,
    };
  }

  /// Aplica os filtros e recarrega os dados do zero.
  Future<void> setFilters({String? name, String? level}) async {
    _nameFilter = name;
    _levelFilter = level;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchPage(0));
  }

  /// Carrega a próxima página de resultados.
  Future<void> loadNextPage() async {
    if (state.isLoading || !state.hasValue) return;

    final currentPage = state.value!;

    if (currentPage.pageNumber >= currentPage.totalPages - 1) {
      return;
    }

    final nextPageData = await _fetchPage(currentPage.pageNumber + 1);

    state = AsyncData(
      nextPageData.copyWith(
        content: [...currentPage.content, ...nextPageData.content],
      ),
    );
  }
}