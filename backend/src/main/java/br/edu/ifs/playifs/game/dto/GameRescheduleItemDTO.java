package br.edu.ifs.playifs.game.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.FutureOrPresent;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import lombok.Data;

import java.time.Instant;

@Data
@Schema(description = "DTO para um item individual no reagendamento de jogos em massa.")
public class GameRescheduleItemDTO {

    @Schema(description = "ID do jogo a ser reagendado.", requiredMode = Schema.RequiredMode.REQUIRED, example = "11")
    @NotNull(message = "O ID do jogo é obrigatório.")
    @Positive(message = "O ID do jogo deve ser um número positivo.")
    private Long gameId;

    @Schema(description = "Nova data e hora para o jogo (formato UTC). Deve ser no presente ou no futuro.", example = "2025-08-10T20:00:00Z", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotNull(message = "A data e hora são obrigatórias.")
    @FutureOrPresent(message = "A data do jogo não pode ser no passado.")
    private Instant dateTime;
}