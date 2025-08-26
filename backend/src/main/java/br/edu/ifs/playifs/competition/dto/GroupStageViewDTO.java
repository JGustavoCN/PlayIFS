package br.edu.ifs.playifs.competition.dto;

import br.edu.ifs.playifs.report.dto.GroupStandingsReportDTO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.hateoas.RepresentationModel;

import java.util.List;

@Data
@AllArgsConstructor
@Schema(description = "DTO para a visualização completa da fase de grupos de um desporto em uma competição.")
public class GroupStageViewDTO extends RepresentationModel<GroupStageViewDTO> {

    @Schema(description = "Lista de todos os grupos, cada um com sua respectiva tabela de classificação.")
    private List<GroupStandingsReportDTO> groups;
}