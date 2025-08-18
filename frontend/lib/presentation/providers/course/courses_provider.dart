// Ficheiro: lib/presentation/providers/course/courses_provider.dart
import 'dart:async';

import 'package:playifs_frontend/core/di/locator.dart';
import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/course/course_summary.dart';
import 'package:playifs_frontend/domain/entities/shared/page.dart';
import 'package:playifs_frontend/domain/usecases/course/find_all_courses_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'courses_provider.g.dart';

@riverpod
class CoursesNotifier extends _$CoursesNotifier {
  late final FindAllCoursesUseCase _findAllCoursesUseCase = locator<FindAllCoursesUseCase>();

  // Para o 'Courses', os filtros são mais complexos, mas o padrão do provider é o mesmo.
  // A UI será responsável por fornecer os filtros corretos.
  @override
  Future<Page<CourseSummary>> build() => _fetchCourses(page: 0);

  Future<Page<CourseSummary>> _fetchCourses({
    required int page,
    Map<String, dynamic>? filters,
  }) async {
    final result = await _findAllCoursesUseCase.execute(page: page, filters: filters);
    return result.when(
      success: (page) => page,
      failure: (exception) => throw exception,
    );
  }

  Future<void> loadNextPage() async {
    if (state.isLoading || !state.hasValue) return;
    final currentPage = state.value!;
    if (currentPage.number >= currentPage.totalPages - 1) return;

    // TODO: Adicionar lógica para preservar filtros ao paginar.
    final nextPageData = await _fetchCourses(page: currentPage.number + 1);
    state = AsyncData(
      currentPage.copyWith(
        content: [...currentPage.content, ...nextPageData.content],
        number: nextPageData.number,
      ),
    );
  }

  /// Realiza uma nova busca com um mapa de filtros.
  Future<void> searchWithFilters(Map<String, dynamic> filters) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchCourses(page: 0, filters: filters));
  }
}