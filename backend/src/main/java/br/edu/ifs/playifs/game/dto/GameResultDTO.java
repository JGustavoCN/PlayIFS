package br.edu.ifs.playifs.game.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.PositiveOrZero;
import lombok.Data;

@Data
@Schema(description = "DTO para registrar o placar final de um jogo.")
public class GameResultDTO {
    @Schema(description = "Placar da Equipa A.", example = "3", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotNull(message = "O placar da Equipa A é obrigatório.")
    @PositiveOrZero(message = "O placar deve ser um número não negativo.")
    private Integer scoreTeamA;

    @Schema(description = "Placar da Equipa B.", example = "1", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotNull(message = "O placar da Equipa B é obrigatório.")
    @PositiveOrZero(message = "O placar deve ser um número não negativo.")
    private Integer scoreTeamB;
}