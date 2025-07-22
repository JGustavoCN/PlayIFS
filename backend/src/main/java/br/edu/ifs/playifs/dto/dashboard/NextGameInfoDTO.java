package br.edu.ifs.playifs.dto.dashboard;

import br.edu.ifs.playifs.entities.Game;
import br.edu.ifs.playifs.entities.Team;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.Instant;

@Data
@NoArgsConstructor
public class NextGameInfoDTO {
    private Long gameId;
    private Instant dateTime;
    private String opponentTeamName;

    public NextGameInfoDTO(Game game, Team myTeam) {
        this.gameId = game.getId();
        this.dateTime = game.getDateTime();
        // Lógica para identificar o adversário
        if (game.getTeamA().getId().equals(myTeam.getId())) {
            this.opponentTeamName = game.getTeamB().getName();
        } else {
            this.opponentTeamName = game.getTeamA().getName();
        }
    }
}