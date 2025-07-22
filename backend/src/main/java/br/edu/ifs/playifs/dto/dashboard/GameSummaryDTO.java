package br.edu.ifs.playifs.dto.dashboard;

import br.edu.ifs.playifs.entities.Game;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.Instant;

@Data
@NoArgsConstructor
public class GameSummaryDTO {
    private Long gameId;
    private Instant dateTime;
    private String myTeam;
    private String opponentTeam;

    public GameSummaryDTO(Game entity, Long myTeamId) {
        this.gameId = entity.getId();
        this.dateTime = entity.getDateTime();
        if (entity.getTeamA().getId().equals(myTeamId)) {
            this.myTeam = entity.getTeamA().getName();
            this.opponentTeam = entity.getTeamB().getName();
        } else {
            this.myTeam = entity.getTeamB().getName();
            this.opponentTeam = entity.getTeamA().getName();
        }
    }
}