// Ficheiro: lib/data/models/course/course_summary_dto.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_summary_dto.freezed.dart';
part 'course_summary_dto.g.dart';

/// DTO para os dados resumidos de um Curso.
@freezed
abstract class CourseSummaryDTO with _$CourseSummaryDTO {
  /// Construtor factory para o DTO.
  const factory CourseSummaryDTO({
    required int id,
    required String name,
    required String level,
    required String campusName,
  }) = _CourseSummaryDTO;

  /// Construtor factory para desserialização a partir de um JSON.
  factory CourseSummaryDTO.fromJson(Map<String, dynamic> json) =>
      _$CourseSummaryDTOFromJson(json);
}