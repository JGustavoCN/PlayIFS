// Ficheiro: lib/domain/repositories/course_repository.dart

import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/course/course_summary.dart';
import 'package:playifs_frontend/domain/entities/shared/page.dart';

/// Contrato para a fonte de dados de Cursos.
abstract class CourseRepository {
  /// Retorna uma página de sumários de cursos, aceitando filtros e ordenação.
  Future<Result<Page<CourseSummary>>> findAll({
    int page = 0,
    int size = 10,
    String? sort,
    Map<String, dynamic>? filters,
  });
}