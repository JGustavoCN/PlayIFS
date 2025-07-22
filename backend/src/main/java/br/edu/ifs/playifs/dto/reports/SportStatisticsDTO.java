package br.edu.ifs.playifs.dto.reports;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL) // Garante que campos nulos não aparecem no JSON
public class SportStatisticsDTO {
    private long totalGames;
    private long totalGoals;
    private double averageGoalsPerGame;
    private HighestScoringGameDTO highestScoringGame;
}