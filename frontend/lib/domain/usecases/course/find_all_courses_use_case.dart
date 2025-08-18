// Ficheiro: lib/domain/usecases/course/find_all_courses_use_case.dart

import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/course/course_summary.dart';
import 'package:playifs_frontend/domain/entities/shared/page.dart';
import 'package:playifs_frontend/domain/repositories/course_repository.dart';

/// Caso de uso para buscar uma lista paginada de cursos.
class FindAllCoursesUseCase {
  /// Construtor que recebe a abstração do repositório.
  const FindAllCoursesUseCase(this._repository);

  final CourseRepository _repository;

  /// Executa o caso de uso.
  Future<Result<Page<CourseSummary>>> execute({
    int page = 0,
    int size = 10,
    String? sort,
    Map<String, dynamic>? filters,
  }) =>
      _repository.findAll(
        page: page,
        size: size,
        sort: sort,
        filters: filters,
      );
}