// Ficheiro: lib/data/mappers/designated_coach_mappers.dart

import 'package:playifs_frontend/data/mappers/athlete_mappers.dart';
import 'package:playifs_frontend/data/mappers/competition_mappers.dart';
import 'package:playifs_frontend/data/mappers/course_mappers.dart';
import 'package:playifs_frontend/data/mappers/sport_mappers.dart';
import 'package:playifs_frontend/data/models/designated_coach/designated_coach_details_dto.dart';
import 'package:playifs_frontend/data/models/designated_coach/designated_coach_input_batch_dto.dart';
import 'package:playifs_frontend/data/models/designated_coach/designated_coach_input_dto.dart';
import 'package:playifs_frontend/data/models/designated_coach/designated_coach_summary_dto.dart';
import 'package:playifs_frontend/domain/entities/designated_coach/designated_coach_details.dart';
import 'package:playifs_frontend/domain/entities/designated_coach/designated_coach_input.dart';
import 'package:playifs_frontend/domain/entities/designated_coach/designated_coach_input_batch.dart';
import 'package:playifs_frontend/domain/entities/designated_coach/designated_coach_summary.dart';
import 'package:playifs_frontend/domain/entities/designated_coach/remove_coach_input.dart';

// DTO -> Entidade
extension DesignatedCoachSummaryDTOToEntity on DesignatedCoachSummaryDTO {
  DesignatedCoachSummary toEntity() => DesignatedCoachSummary(
    id: id,
    competitionName: competitionName,
    sportName: sportName,
    courseName: courseName,
    athleteName: athleteName,
  );
}

extension DesignatedCoachDetailsDTOToEntity on DesignatedCoachDetailsDTO {
  DesignatedCoachDetails toEntity() => DesignatedCoachDetails(
    id: id,
    competition: competition.toEntity(),
    sport: sport.toEntity(),
    course: course.toEntity(),
    coach: coach.toEntity(),
  );
}

// Entidade -> DTO
extension DesignatedCoachInputToDTO on DesignatedCoachInput {
  DesignatedCoachInputDTO toDTO() => DesignatedCoachInputDTO(
    competitionId: competitionId,
    sportId: sportId,
    courseId: courseId,
    coachId: coachId,
  );
}

extension DesignatedCoachInputBatchToDTO on DesignatedCoachInputBatch {
  DesignatedCoachInputBatchDTO toDTO() => DesignatedCoachInputBatchDTO(
    coaches: designations.map((d) => d.toDTO()).toList(),
  );
}

extension RemoveCoachInputToQueries on RemoveCoachInput {
  Map<String, dynamic> toQueries() => {
    'competitionId': competitionId,
    'sportId': sportId,
    'courseId': courseId,
  };
}