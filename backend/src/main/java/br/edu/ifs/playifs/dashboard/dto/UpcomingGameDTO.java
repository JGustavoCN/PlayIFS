package br.edu.ifs.playifs.dashboard.dto;

import br.edu.ifs.playifs.game.model.Game;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.Instant;

@Data
@NoArgsConstructor
@Schema(description = "DTO simplificado para representar um próximo jogo no dashboard do coordenador.")
public class UpcomingGameDTO {
    @Schema(description = "ID do jogo.", example = "101")
    private Long gameId;

    @Schema(description = "Data e hora do jogo.")
    private Instant dateTime;

    @Schema(description = "Nome da competição.", example = "JIFS 2025 - Etapa Aracaju")
    private String competitionName;

    @Schema(description = "Nome do desporto.", example = "Futsal")
    private String sportName;

    @Schema(description = "Nome da Equipa A.", example = "Info Futsal PRO")
    private String teamAName;

    @Schema(description = "Nome da Equipa B.", example = "Edificações FC")
    private String teamBName;

    public UpcomingGameDTO(Game entity) {
        this.gameId = entity.getId();
        this.dateTime = entity.getDateTime();
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