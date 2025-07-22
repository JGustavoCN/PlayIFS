package br.edu.ifs.playifs.dto.dashboard;

import br.edu.ifs.playifs.entities.Game;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true) // Herda os campos de GameSummaryDTO
public class RecentResultDTO extends GameSummaryDTO {
    private String result;
    private String score;

    public RecentResultDTO(Game entity, Long myTeamId) {
        super(entity, myTeamId);
        Integer myScore = entity.getTeamA().getId().equals(myTeamId) ? entity.getScoreTeamA() : entity.getScoreTeamB();
        Integer opponentScore = entity.getTeamA().getId().equals(myTeamId) ? entity.getScoreTeamB() : entity.getScoreTeamA();
        this.score = myScore + " x " + opponentScore;

        if (myScore > opponentScore) this.result = "VITÓRIA";
        else if (opponentScore > myScore) this.result = "DERROTA";
        else this.result = "EMPATE";
    }
}