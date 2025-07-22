package br.edu.ifs.playifs.dto.reports;

import br.edu.ifs.playifs.entities.Game;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class WoGameInfoDTO {
    private Long gameId;
    private String phase;
    private String teamThatLostByWo;

    public WoGameInfoDTO(Game entity) {
        this.gameId = entity.getId();
        this.phase = entity.getPhase().toString();

        // Lógica para determinar qual equipa perdeu por W.O.
        if (entity.getScoreTeamA() > entity.getScoreTeamB()) {
            this.teamThatLostByWo = entity.getTeamB().getName();
        } else {
            this.teamThatLostByWo = entity.getTeamA().getName();
        }
    }
}