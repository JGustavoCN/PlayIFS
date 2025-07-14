package br.edu.ifs.playifs.dto;

import br.edu.ifs.playifs.entities.Game;
import br.edu.ifs.playifs.entities.enums.GamePhase;
import br.edu.ifs.playifs.entities.enums.GameStatus;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.Instant;

@Data
@NoArgsConstructor
public class GameDTO {

    private Long id;
    private Instant dateTime;
    private GameStatus status;
    private GamePhase phase;
    private TeamDTO teamA;
    private TeamDTO teamB;
    private Integer scoreTeamA;
    private Integer scoreTeamB;

    public GameDTO(Game entity) {
        this.id = entity.getId();
        this.dateTime = entity.getDateTime();
        this.status = entity.getStatus();
        this.phase = entity.getPhase();
        this.teamA = new TeamDTO(entity.getTeamA());
        this.teamB = new TeamDTO(entity.getTeamB());
        this.scoreTeamA = entity.getScoreTeamA();
        this.scoreTeamB = entity.getScoreTeamB();
    }
}
