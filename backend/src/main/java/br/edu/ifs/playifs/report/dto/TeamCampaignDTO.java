package br.edu.ifs.playifs.report.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.springframework.hateoas.RepresentationModel;

@Data
@NoArgsConstructor
@AllArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
@Schema(description = "Relatório detalhado sobre a campanha de uma equipa específica em uma competição.")
@EqualsAndHashCode(callSuper = false)
public class TeamCampaignDTO extends RepresentationModel<TeamCampaignDTO> {

    @Schema(description = "Nome da equipa.", example = "Info Futsal PRO")
    private String teamName;

    @Schema(description = "Nome da competição.", example = "JIFS 2025 - Etapa Aracaju")
    private String competitionName;

    @Schema(description = "Estatísticas da equipa na fase de grupos.")
    private GroupPhaseStats groupPhase;

    @Schema(description = "Resumo do desempenho da equipa na fase eliminatória (se aplicável).")
    private EliminationPhaseStats eliminationPhase;

    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    @Schema(description = "Estatísticas da fase de grupos.")
    public static class GroupPhaseStats {
        @Schema(description = "Vitórias.", example = "2")
        private int wins = 0;
        @Schema(description = "Empates.", example = "1")
        private int draws = 0;
        @Schema(description = "Derrotas.", example = "0")
        private int losses = 0;
        @Schema(description = "Gols marcados.", example = "15")
        private int goalsFor = 0;
        @Schema(description = "Gols sofridos.", example = "7")
        private int goalsAgainst = 0;
    }

    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    @Schema(description = "Resumo da fase eliminatória.")
    public static class EliminationPhaseStats {
        @Schema(description = "Fase mais distante alcançada.", example = "FINAL")
        private String reached;
        @Schema(description = "Posição final no campeonato (1 para campeão, 2 para vice).", example = "1")
        private Integer finalPosition;
    }
}