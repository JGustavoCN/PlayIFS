// Ficheiro: lib/data/models/designated_coach/designated_coach_details_dto.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playifs_frontend/data/models/athlete/athlete_summary_dto.dart';
import 'package:playifs_frontend/data/models/competition/competition_summary_dto.dart';
import 'package:playifs_frontend/data/models/course/course_summary_dto.dart';
import 'package:playifs_frontend/data/models/sport/sport_summary_dto.dart';

part 'designated_coach_details_dto.freezed.dart';
part 'designated_coach_details_dto.g.dart';

@freezed
abstract class DesignatedCoachDetailsDTO with _$DesignatedCoachDetailsDTO {
  const factory DesignatedCoachDetailsDTO({
    required int id,
    required CompetitionSummaryDTO competition,
    required SportSummaryDTO sport,
    required CourseSummaryDTO course,
    required AthleteSummaryDTO coach,
  }) = _DesignatedCoachDetailsDTO;

  factory DesignatedCoachDetailsDTO.fromJson(Map<String, dynamic> json) =>
      _$DesignatedCoachDetailsDTOFromJson(json);
}