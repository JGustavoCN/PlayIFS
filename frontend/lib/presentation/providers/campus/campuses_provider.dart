// Ficheiro: lib/presentation/providers/campus/campuses_provider.dart
import 'dart:async';

import 'package:playifs_frontend/core/di/locator.dart';
import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/campus/campus_summary.dart';
import 'package:playifs_frontend/domain/entities/shared/page.dart';
import 'package:playifs_frontend/domain/usecases/campus/find_all_campuses_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'campuses_provider.g.dart';

@riverpod
class CampusesNotifier extends _$CampusesNotifier {
  late final FindAllCampusesUseCase _findAllCampusesUseCase = locator<FindAllCampusesUseCase>();

  @override
  Future<Page<CampusSummary>> build() => _fetchCampuses(page: 0);

  Future<Page<CampusSummary>> _fetchCampuses({
    required int page,
    String? name,
  }) async {
    final filters = <String, dynamic>{};
    if (name != null && name.isNotEmpty) {
      filters['name'] = name;
    }

    final result = await _findAllCampusesUseCase.execute(page: page, filters: filters);
    return result.when(
      success: (page) => page,
      failure: (exception) => throw exception,
    );
  }

  Future<void> loadNextPage() async {
    if (state.isLoading || !state.hasValue) return;
    final currentPage = state.value!;
    if (currentPage.number >= currentPage.totalPages - 1) return;

    final nextPageData = await _fetchCampuses(page: currentPage.number + 1);
    state = AsyncData(
      currentPage.copyWith(
        content: [...currentPage.content, ...nextPageData.content],
        number: nextPageData.number,
      ),
    );
  }

  Future<void> searchByName(String name) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchCampuses(page: 0, name: name));
  }
}