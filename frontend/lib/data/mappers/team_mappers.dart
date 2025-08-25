import 'package:playifs_frontend/data/mappers/athlete_mappers.dart';
import 'package:playifs_frontend/data/models/team/team_details_dto.dart';
import 'package:playifs_frontend/data/models/team/team_input_dto.dart';
import 'package:playifs_frontend/data/models/team/team_summary_dto.dart';
import 'package:playifs_frontend/data/models/team/team_update_dto.dart';
import 'package:playifs_frontend/domain/entities/team/team_details.dart';
import 'package:playifs_frontend/domain/entities/team/team_input.dart';
import 'package:playifs_frontend/domain/entities/team/team_summary.dart';
import 'package:playifs_frontend/domain/entities/team/team_update.dart';

extension TeamSummaryDTOToEntity on TeamSummaryDTO {
  TeamSummary toEntity() => TeamSummary(
    id: id,
    name: name,
  );
}

extension TeamDetailsDTOToEntity on TeamDetailsDTO {
  TeamDetails toEntity() => TeamDetails(
    id: id,
    name: name,
    // ✅ CORREÇÃO: Mapeando dos objetos aninhados para as propriedades da entidade.
    competitionName: competition.name,
    competitionId: competition.id,
    sportName: sport.name,
    sportId: sport.id,
    courseName: course.name,
    courseId: course.id,
    coachName: coach.fullName,
    coachId: coach.id,
    athletes: athletes.map((dto) => dto.toEntity()).toList(),
  );
}

extension TeamInputToDTO on TeamInput {
  TeamInputDTO toDTO() => TeamInputDTO(
    name: name,
    competitionId: competitionId,
    sportId: sportId,
    courseId: courseId,
    coachId: coachId,
    athleteIds: athleteIds,
  );
}

extension TeamUpdateToDTO on TeamUpdate {
  TeamUpdateDTO toDTO() => TeamUpdateDTO(name: name);
}