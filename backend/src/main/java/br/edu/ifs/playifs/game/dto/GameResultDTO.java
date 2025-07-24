package br.edu.ifs.playifs.game.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Data
@Schema(description = "DTO para submeter o resultado final de um jogo.")
public class GameResultDTO {
    @Schema(description = "Placar final da Equipa A.", example = "3", requiredMode = Schema.RequiredMode.REQUIRED)
    private Integer scoreTeamA;

    @Schema(description = "Placar final da Equipa B.", example = "2", requiredMode = Schema.RequiredMode.REQUIRED)
    private Integer scoreTeamB;
}