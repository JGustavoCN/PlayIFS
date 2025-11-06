import 'dart:async';
import 'package:playifs_frontend/core/di/locator.dart';
import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/game/game_summary.dart';
import 'package:playifs_frontend/domain/entities/shared/page.dart';
import 'package:playifs_frontend/domain/usecases/game/find_all_games_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'games_list_provider.g.dart';

@riverpod
class GamesListNotifier extends _$GamesListNotifier {
  late final FindAllGamesUseCase _findAllUseCase;

  int? _teamId;
  int? _competitionId;
  int? _sportId;
  String? _status;
  String? _phase;

  @override
  Future<Page<GameSummary>> build() {
    _findAllUseCase = locator<FindAllGamesUseCase>();
    return _fetchPage(0);
  }

  Future<Page<GameSummary>> _fetchPage(int page) async {
    final result = await _findAllUseCase.execute(
      page: page,
      teamId: _teamId,
      competitionId: _competitionId,
      sportId: _sportId,
      status: _status,
      phase: _phase,
    );

    return switch (result) {
      Success(data: final pageData) => pageData,
      Failure(error: final e) => throw e,
    };
  }

  Future<void> setFilters({
    int? teamId,
    int? competitionId,
    int? sportId,
    String? status,
    String? phase,
  }) async {
    _teamId = teamId;
    _competitionId = competitionId;
    _sportId = sportId;
    _status = status;
    _phase = phase;

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchPage(0));
  }

  Future<void> loadNextPage() async {
    if (state.isLoading || !state.hasValue) return;

    final currentPage = state.value!;
    if (currentPage.pageNumber >= currentPage.totalPages - 1) return;

    final nextPage = currentPage.pageNumber + 1;
    state = await AsyncValue.guard(() async {
      final newPage = await _fetchPage(nextPage);
      return newPage.copyWith(
        content: [...currentPage.content, ...newPage.content],
      );
    });
  }
}