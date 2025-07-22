package br.edu.ifs.playifs.dto.reports;

import br.edu.ifs.playifs.services.util.TeamStanding;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class TeamStandingDTO {
    private String teamName;
    private int points;
    private int wins;
    private int goalsFor;
    private int goalsAgainst;
    private int goalDifference;

    public TeamStandingDTO(TeamStanding standing) {
        this.teamName = standing.getTeam().getName();
        this.points = standing.getPoints();
        this.wins = standing.getWins();
        this.goalsFor = standing.getGoalsFor();
        this.goalsAgainst = standing.getGoalsAgainst();
        this.goalDifference = standing.getGoalDifference();
    }
}