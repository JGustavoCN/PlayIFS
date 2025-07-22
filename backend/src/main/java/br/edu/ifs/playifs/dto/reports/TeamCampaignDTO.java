package br.edu.ifs.playifs.dto.reports;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
// Garante que a secção 'eliminationPhase' só aparece se não for nula
@JsonInclude(JsonInclude.Include.NON_NULL)
public class TeamCampaignDTO {

    private String teamName;
    private String competitionName;
    private GroupPhaseStats groupPhase;
    private EliminationPhaseStats eliminationPhase;

    // Sub-classe para as estatísticas da fase de grupos
    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class GroupPhaseStats {
        private int wins = 0;
        private int draws = 0;
        private int losses = 0;
        private int goalsFor = 0;
        private int goalsAgainst = 0;
    }

    // Sub-classe para o resumo da fase eliminatória
    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class EliminationPhaseStats {
        private String reached; // Ex: "Final", "Semifinais"
        private Integer finalPosition; // Ex: 1, 2
    }
}