package br.edu.ifs.playifs.report.dto;

import br.edu.ifs.playifs.shared.util.TeamStanding;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.springframework.hateoas.RepresentationModel;

@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@Schema(description = "Representa a posição e as estatísticas de uma única equipa na tabela de classificação de um grupo.")
public class TeamStandingDTO extends RepresentationModel<TeamStandingDTO> {

    @Schema(description = "ID da equipa.", example = "12")
    private Long teamId;

    @Schema(description = "Nome da equipa.", example = "Info Futsal PRO")
    private String teamName;

    @Schema(description = "Total de pontos.", example = "7")
    private int points;

    @Schema(description = "Número de vitórias.", example = "2")
    private int wins;

    @Schema(description = "Total de gols marcados.", example = "15")
    private int goalsFor;

    @Schema(description = "Total de gols sofridos.", example = "7")
    private int goalsAgainst;

    @Schema(description = "Saldo de gols.", example = "8")
    private int goalDifference;

    public TeamStandingDTO(TeamStanding standing) {
        this.teamId = standing.getTeam().getId();
        this.teamName = standing.getTeam().getName();
        this.points = standing.getPoints();
        this.wins = standing.getWins();
        this.goalsFor = standing.getGoalsFor();
        this.goalsAgainst = standing.getGoalsAgainst();
        this.goalDifference = standing.getGoalDifference();
    }
}