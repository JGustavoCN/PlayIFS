import 'package:playifs_frontend/data/mappers/sport_mappers.dart';
import 'package:playifs_frontend/data/models/competition/competition_details_dto.dart';
import 'package:playifs_frontend/data/models/competition/competition_input_dto.dart';
import 'package:playifs_frontend/data/models/competition/competition_summary_dto.dart';
import 'package:playifs_frontend/domain/entities/competition/competition_details.dart';
import 'package:playifs_frontend/domain/entities/competition/competition_input.dart';
import 'package:playifs_frontend/domain/entities/competition/competition_summary.dart';

// DTO -> Entidade
extension CompetitionSummaryDTOToEntity on CompetitionSummaryDTO {
  CompetitionSummary toEntity() => CompetitionSummary(
    id: id,
    name: name,
    level: level,
  );
}

extension CompetitionDetailsDTOToEntity on CompetitionDetailsDTO {
  CompetitionDetails toEntity() => CompetitionDetails(
    id: id,
    name: name,
    level: level,
    // ADICIONADO: Mapeamento do novo campo de status.
    status: status,
    // ADICIONADO: Mapeamento da lista de desportos.
    // Isto assume que existe um mapeador 'toEntity()' para SportSummaryDTO.
    associatedSports: associatedSports.map((dto) => dto.toEntity()).toList(),
  );
}

// Entidade -> DTO
extension CompetitionInputToDTO on CompetitionInput {
  CompetitionInputDTO toDTO() => CompetitionInputDTO(
    name: name,
    level: level,
    // ADICIONADO: Mapeamento da lista de IDs.
    sportIds: sportIds,
  );
}