// Ficheiro: lib/data/models/designated_coach/designated_coach_summary_dto.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'designated_coach_summary_dto.freezed.dart';
part 'designated_coach_summary_dto.g.dart';

@freezed
abstract class DesignatedCoachSummaryDTO with _$DesignatedCoachSummaryDTO {
  const factory DesignatedCoachSummaryDTO({
    required int id,
    required String competitionName,
    required String sportName,
    required String courseName,
    required String athleteName,
  }) = _DesignatedCoachSummaryDTO;

  factory DesignatedCoachSummaryDTO.fromJson(Map<String, dynamic> json) =>
      _$DesignatedCoachSummaryDTOFromJson(json);
}