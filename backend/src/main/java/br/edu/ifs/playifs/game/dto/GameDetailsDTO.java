package br.edu.ifs.playifs.game.dto;

import br.edu.ifs.playifs.game.model.Game;
import br.edu.ifs.playifs.game.model.enums.GamePhase;
import br.edu.ifs.playifs.game.model.enums.GameStatus;
import br.edu.ifs.playifs.team.dto.TeamSummaryDTO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.Instant;

@Data
@NoArgsConstructor
@Schema(description = "Representa os dados completos de um único jogo.")
public class GameDetailsDTO {

    @Schema(description = "ID único do jogo.", example = "1")
    private Long id;

    @Schema(description = "Data e hora do jogo.")
    private Instant dateTime;

    @Schema(description = "Status atual do jogo.", example = "SCHEDULED")
    private GameStatus status;

    @Schema(description = "Fase da competição a que o jogo pertence.", example = "GROUP_STAGE")
    private GamePhase phase;

    @Schema(description = "Detalhes da Equipa A.")
    private TeamSummaryDTO teamA;

    @Schema(description = "Detalhes da Equipa B.")
    private TeamSummaryDTO teamB;

    @Schema(description = "Placar da Equipa A. Nulo se o jogo não estiver finalizado.", example = "3")
    private Integer scoreTeamA;

    @Schema(description = "Placar da Equipa B. Nulo se o jogo não estiver finalizado.", example = "2")
    private Integer scoreTeamB;

    @Schema(description = "Data e hora da criação do registo.", accessMode = Schema.AccessMode.READ_ONLY)
    private Instant createdAt;

    @Schema(description = "Data e hora da última atualização do registo.", accessMode = Schema.AccessMode.READ_ONLY)
    private Instant updatedAt;

    public GameDetailsDTO(Game entity) {
        this.id = entity.getId();
        this.dateTime = entity.getDateTime();
        this.status = entity.getStatus();
        this.phase = entity.getPhase();
        this.teamA = new TeamSummaryDTO(entity.getTeamA());
        this.teamB = new TeamSummaryDTO(entity.getTeamB());
        this.scoreTeamA = entity.getScoreTeamA();
        this.scoreTeamB = entity.getScoreTeamB();
        this.createdAt = entity.getCreatedAt();
        this.updatedAt = entity.getUpdatedAt();
    }
}