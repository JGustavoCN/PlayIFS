package br.edu.ifs.playifs.report.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
@Schema(description = "Relatório com estatísticas agregadas de um desporto dentro de uma competição.")
public class SportStatisticsDTO {
    @Schema(description = "Número total de jogos finalizados.", example = "25")
    private long totalGames;

    @Schema(description = "Número total de gols marcados.", example = "150")
    private long totalGoals;

    @Schema(description = "Média de gols por partida.", example = "6.0")
    private double averageGoalsPerGame;

    @Schema(description = "Detalhes do jogo com o maior placar agregado.")
    private HighestScoringGameDTO highestScoringGame;
}