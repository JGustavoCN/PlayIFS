// Ficheiro: lib/data/mappers/course_mappers.dart
import 'package:playifs_frontend/data/models/course/course_summary_dto.dart';
import 'package:playifs_frontend/domain/entities/course/course_summary.dart';

extension CourseSummaryDTOToEntity on CourseSummaryDTO {
  CourseSummary toEntity() => CourseSummary(
    id: id,
    name: name,
    level: level,
    campusName: campusName,
  );
}