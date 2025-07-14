package br.edu.ifs.playifs.services.util;

import br.edu.ifs.playifs.entities.Team;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class TeamStanding {

    @EqualsAndHashCode.Include
    private Team team;
    private int points = 0;
    private int wins = 0;
    private int goalsFor = 0;
    private int goalsAgainst = 0;

    public TeamStanding(Team team) {
        this.team = team;
    }

    public int getGoalDifference() {
        return goalsFor - goalsAgainst;
    }

    // Método para comparar e ordenar os times
    public int compareTo(TeamStanding other) {
        // Critério 1: Pontos (maior primeiro)
        int pointsCompare = Integer.compare(other.points, this.points);
        if (pointsCompare != 0) {
            return pointsCompare;
        }
        // Critério 2: Saldo de Gols (maior primeiro)
        int gdCompare = Integer.compare(other.getGoalDifference(), this.getGoalDifference());
        if (gdCompare != 0) {
            return gdCompare;
        }
        // Critério 3: Gols Pró (maior primeiro)
        return Integer.compare(other.goalsFor, this.goalsFor);
    }
}
