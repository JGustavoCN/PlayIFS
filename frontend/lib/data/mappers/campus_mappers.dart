// Ficheiro: lib/data/mappers/campus_mappers.dart
import 'package:playifs_frontend/data/models/campus/campus_summary_dto.dart';
import 'package:playifs_frontend/domain/entities/campus/campus_summary.dart';

extension CampusSummaryDTOToEntity on CampusSummaryDTO {
  CampusSummary toEntity() => CampusSummary(id: id, name: name);
}