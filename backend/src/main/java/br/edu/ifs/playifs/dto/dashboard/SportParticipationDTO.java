package br.edu.ifs.playifs.dto.dashboard;

import br.edu.ifs.playifs.entities.Athlete;
import br.edu.ifs.playifs.entities.Game;
import br.edu.ifs.playifs.entities.Team;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL) // Oculta campos nulos (como o nextGame)
public class SportParticipationDTO {
    private Long sportId;
    private String sportName;
    private Long teamId;
    private String teamName;
    private boolean isCoach;
    private NextGameInfoDTO nextGame;

    public SportParticipationDTO(Team team, Athlete athlete, Game nextGameEntity) {
        this.sportId = team.getSport().getId();
        this.sportName = team.getSport().getName();
        this.teamId = team.getId();
        this.teamName = team.getName();
        // Lógica para verificar se o atleta logado é o técnico desta equipa
        this.isCoach = team.getCoach().getId().equals(athlete.getId());
        if (nextGameEntity != null) {
            this.nextGame = new NextGameInfoDTO(nextGameEntity, team);
        }
    }
}