// Ficheiro: lib/domain/entities/course/course_summary.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_summary.freezed.dart';

/// Representa os dados resumidos de um Curso.
@freezed
abstract class CourseSummary with _$CourseSummary {
  /// Construtor factory para criar uma instância imutável de CourseSummary.
  const factory CourseSummary({
    required int id,
    required String name,
    required String level,
    required String campusName,
  }) = _CourseSummary;
}