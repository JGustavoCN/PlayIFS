package br.edu.ifs.playifs.dashboard.dto;

import br.edu.ifs.playifs.user.model.Athlete;
import br.edu.ifs.playifs.game.model.Game;
import br.edu.ifs.playifs.team.model.Team;
import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
@Schema(description = "DTO que representa a participação de um atleta em um desporto dentro de uma competição.")
public class SportParticipationDTO {
    @Schema(description = "ID do desporto.", example = "1")
    private Long sportId;

    @Schema(description = "Nome do desporto.", example = "Futsal")
    private String sportName;

    @Schema(description = "ID da equipa.", example = "12")
    private Long teamId;

    @Schema(description = "Nome da equipa.", example = "Info Futsal PRO")
    private String teamName;

    @Schema(description = "Indica se o atleta logado é o técnico desta equipa.", example = "true")
    private boolean isCoach;

    @Schema(description = "Informações sobre o próximo jogo da equipa (se houver).")
    private NextGameInfoDTO nextGame;

    public SportParticipationDTO(Team team, Athlete athlete, Game nextGameEntity) {
        this.sportId = team.getSport().getId();
        this.sportName = team.getSport().getName();
        this.teamId = team.getId();
        this.teamName = team.getName();
        this.isCoach = team.getCoach().getId().equals(athlete.getId());
        if (nextGameEntity != null) {
            this.nextGame = new NextGameInfoDTO(nextGameEntity, team);
        }
    }
}