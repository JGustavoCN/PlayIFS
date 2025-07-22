package br.edu.ifs.playifs.dto.dashboard;

import br.edu.ifs.playifs.entities.Game;
import br.edu.ifs.playifs.entities.Team;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ManagedTeamDTO {
    private Long teamId;
    private String teamName;
    private String sportName;
    private int rosterSize;
    private int maxAthletes;
    private GameSummaryDTO nextGame;

    public ManagedTeamDTO(Team entity, Game nextGameEntity) {
        this.teamId = entity.getId();
        this.teamName = entity.getName();
        this.sportName = entity.getSport().getName();
        this.rosterSize = entity.getAthletes().size();
        this.maxAthletes = entity.getSport().getMaxAthletes();
        if (nextGameEntity != null) {
            this.nextGame = new GameSummaryDTO(nextGameEntity, entity.getId());
        }
    }
}