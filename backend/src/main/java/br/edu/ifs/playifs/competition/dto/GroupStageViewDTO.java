package br.edu.ifs.playifs.competition.dto;

import br.edu.ifs.playifs.game.dto.GameSummaryDTO;
import br.edu.ifs.playifs.report.dto.GroupStandingsReportDTO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.springframework.hateoas.RepresentationModel;

import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
@Schema(description = "DTO para a visualização completa da fase de grupos de um desporto em uma competição.")
public class GroupStageViewDTO extends RepresentationModel<GroupStageViewDTO> {

    @Schema(description = "Lista de todos os grupos, cada um com sua respectiva tabela de classificação.")
    private List<GroupStandingsReportDTO> groups;

    @Schema(description = "Lista de todos os jogos (agendados e concluídos) desta fase de grupos.")
    private List<GameSummaryDTO> games;
}