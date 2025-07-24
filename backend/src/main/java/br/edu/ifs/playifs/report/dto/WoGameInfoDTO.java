package br.edu.ifs.playifs.report.dto;

import br.edu.ifs.playifs.game.model.Game;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Schema(description = "Detalhes de um único jogo que terminou em W.O.")
public class WoGameInfoDTO {
    @Schema(description = "ID do jogo.", example = "78")
    private Long gameId;

    @Schema(description = "Fase do campeonato em que o jogo ocorreu.", example = "GROUP_STAGE")
    private String phase;

    @Schema(description = "Nome da equipa que perdeu por W.O.", example = "Química FC")
    private String teamThatLostByWo;

    public WoGameInfoDTO(Game entity) {
        this.gameId = entity.getId();
        this.phase = entity.getPhase().toString();
        if (entity.getScoreTeamA() > entity.getScoreTeamB()) {
            this.teamThatLostByWo = entity.getTeamB().getName();
        } else {
            this.teamThatLostByWo = entity.getTeamA().getName();
        }
    }
}