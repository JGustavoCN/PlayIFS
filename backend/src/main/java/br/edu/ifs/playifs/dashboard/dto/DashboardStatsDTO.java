package br.edu.ifs.playifs.dashboard.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
@Schema(description = "DTO com as estatísticas gerais do sistema para o dashboard do coordenador.")
public class DashboardStatsDTO {
    @Schema(description = "Número de competições ativas.", example = "3")
    private long activeCompetitions;

    @Schema(description = "Número total de equipas inscritas.", example = "48")
    private long totalTeams;

    @Schema(description = "Número total de atletas cadastrados.", example = "512")
    private long totalAthletes;

    @Schema(description = "Número de jogos agendados cujo horário já passou, mas que ainda não tiveram o resultado lançado.", example = "5")
    private long gamesPendingResult;
}