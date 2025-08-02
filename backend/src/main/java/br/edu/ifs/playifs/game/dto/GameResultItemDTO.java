package br.edu.ifs.playifs.game.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import jakarta.validation.constraints.PositiveOrZero;
import lombok.Data;

@Data
@Schema(description = "DTO para um item individual na atualização de resultados em massa.")
public class GameResultItemDTO {

    @Schema(description = "ID do jogo a ser atualizado.", requiredMode = Schema.RequiredMode.REQUIRED, example = "10")
    @NotNull(message = "O ID do jogo é obrigatório.")
    @Positive(message = "O ID do jogo deve ser um número positivo.")
    private Long gameId;

    @Schema(description = "Placar final da Equipa A.", requiredMode = Schema.RequiredMode.REQUIRED, example = "5")
    @NotNull(message = "O placar da Equipa A é obrigatório.")
    @PositiveOrZero(message = "O placar deve ser um número não negativo.")
    private Integer scoreTeamA;

    @Schema(description = "Placar final da Equipa B.", requiredMode = Schema.RequiredMode.REQUIRED, example = "3")
    @NotNull(message = "O placar da Equipa B é obrigatório.")
    @PositiveOrZero(message = "O placar deve ser um número não negativo.")
    private Integer scoreTeamB;
}