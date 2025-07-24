package br.edu.ifs.playifs.dashboard.dto;

import br.edu.ifs.playifs.game.model.Game;
import br.edu.ifs.playifs.team.model.Team;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.Instant;

@Data
@NoArgsConstructor
@Schema(description = "DTO com informações do próximo jogo de uma equipa específica.")
public class NextGameInfoDTO {
    @Schema(description = "ID do próximo jogo.", example = "102")
    private Long gameId;

    @Schema(description = "Data e hora do próximo jogo.")
    private Instant dateTime;

    @Schema(description = "Nome da equipa adversária.", example = "Química FC")
    private String opponentTeamName;

    public NextGameInfoDTO(Game game, Team myTeam) {
        this.gameId = game.getId();
        this.dateTime = game.getDateTime();
        if (game.getTeamA().getId().equals(myTeam.getId())) {
            this.opponentTeamName = game.getTeamB().getName();
        } else {
            this.opponentTeamName = game.getTeamA().getName();
        }
    }
}