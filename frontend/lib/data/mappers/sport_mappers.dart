// Ficheiro: lib/data/mappers/sport_mappers.dart
import 'package:playifs_frontend/data/models/sport/sport_summary_dto.dart';
import 'package:playifs_frontend/domain/entities/sport/sport_summary.dart';

extension SportSummaryDTOToEntity on SportSummaryDTO {
  SportSummary toEntity() => SportSummary(id: id, name: name);
}