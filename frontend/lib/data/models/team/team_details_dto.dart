import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playifs_frontend/data/models/athlete/athlete_summary_dto.dart';
import 'package:playifs_frontend/data/models/competition/competition_summary_dto.dart';
import 'package:playifs_frontend/data/models/course/course_summary_dto.dart';
import 'package:playifs_frontend/data/models/sport/sport_summary_dto.dart';

part 'team_details_dto.freezed.dart';
part 'team_details_dto.g.dart';

@freezed
abstract class TeamDetailsDTO with _$TeamDetailsDTO {
  const factory TeamDetailsDTO({
    required int id,
    required String name,
    // ✅ CORREÇÃO: Campos agora são objetos DTO aninhados para espelhar a API.
    required CompetitionSummaryDTO competition,
    required SportSummaryDTO sport,
    required CourseSummaryDTO course,
    required AthleteSummaryDTO coach,
    required List<AthleteSummaryDTO> athletes,
  }) = _TeamDetailsDTO;

  factory TeamDetailsDTO.fromJson(Map<String, dynamic> json) =>
      _$TeamDetailsDTOFromJson(json);
}