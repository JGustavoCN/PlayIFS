package br.edu.ifs.playifs.dto.dashboard;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor // Usaremos um construtor com todos os argumentos
public class DashboardStatsDTO {
    private long activeCompetitions;
    private long totalTeams;
    private long totalAthletes;
    private long gamesPendingResult;
}