package br.edu.ifs.playifs.game.dto;

import br.edu.ifs.playifs.game.model.Game;
import br.edu.ifs.playifs.game.model.enums.GamePhase;
import br.edu.ifs.playifs.game.model.enums.GameStatus;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.Instant;

@Data
@NoArgsConstructor
@Schema(description = "DTO para representar os dados resumidos de um jogo, ideal para listagens.")
public class GameSummaryDTO {

    @Schema(description = "ID único do jogo.", example = "1")
    private Long id;

    @Schema(description = "Data e hora do jogo.")
    private Instant dateTime;

    @Schema(description = "Status atual do jogo.", example = "SCHEDULED")
    private GameStatus status;

    @Schema(description = "Fase da competição a que o jogo pertence.", example = "GROUP_STAGE")
    private GamePhase phase;

    @Schema(description = "Nome da Equipa A.", example = "Info Futsal PRO")
    private String teamAName;

    @Schema(description = "Nome da Equipa B.", example = "Edificações FC")
    private String teamBName;

    @Schema(description = "Data e hora da criação do registo.", accessMode = Schema.AccessMode.READ_ONLY)
    private Instant createdAt;

    @Schema(description = "Data e hora da última atualização do registo.", accessMode = Schema.AccessMode.READ_ONLY)
    private Instant updatedAt;

    public GameSummaryDTO(Game entity) {
        this.id = entity.getId();
        this.dateTime = entity.getDateTime();
        this.status = entity.getStatus();
        this.phase = entity.getPhase();
        if (entity.getTeamA() != null) {
            this.teamAName = entity.getTeamA().getName();
        }
        if (entity.getTeamB() != null) {
            this.teamBName = entity.getTeamB().getName();
        }
        this.createdAt = entity.getCreatedAt();
        this.updatedAt = entity.getUpdatedAt();
    }
}