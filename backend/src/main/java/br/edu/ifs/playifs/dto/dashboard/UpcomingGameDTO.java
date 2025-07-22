package br.edu.ifs.playifs.dto.dashboard;

import br.edu.ifs.playifs.entities.Game;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.Instant;

@Data
@NoArgsConstructor
public class UpcomingGameDTO {
    private Long gameId;
    private Instant dateTime;
    private String competitionName;
    private String sportName;
    private String teamAName;
    private String teamBName;

    public UpcomingGameDTO(Game entity) {
        this.gameId = entity.getId();
        this.dateTime = entity.getDateTime();
        // Acesso seguro aos nomes, assumindo que as associações não são nulas
        if (entity.getTeamA() != null && entity.getTeamA().getCompetition() != null) {
            this.competitionName = entity.getTeamA().getCompetition().getName();
            this.sportName = entity.getTeamA().getSport().getName();
            this.teamAName = entity.getTeamA().getName();
        }
        if (entity.getTeamB() != null) {
            this.teamBName = entity.getTeamB().getName();
        }
    }
}