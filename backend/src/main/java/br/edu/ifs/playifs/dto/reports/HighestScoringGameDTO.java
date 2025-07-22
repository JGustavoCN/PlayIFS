package br.edu.ifs.playifs.dto.reports;

import br.edu.ifs.playifs.entities.Game;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class HighestScoringGameDTO {
    private String teamA;
    private String teamB;
    private String score;

    public HighestScoringGameDTO(Game entity) {
        this.teamA = entity.getTeamA().getName();
        this.teamB = entity.getTeamB().getName();
        this.score = entity.getScoreTeamA() + " – " + entity.getScoreTeamB();
    }
}