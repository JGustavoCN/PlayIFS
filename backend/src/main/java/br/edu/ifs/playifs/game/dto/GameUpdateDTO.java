package br.edu.ifs.playifs.game.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.FutureOrPresent;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import java.time.Instant;

@Data
@Schema(description = "DTO para atualizar a data e hora de um jogo.")
public class GameUpdateDTO {
    @Schema(description = "Nova data e hora para o jogo (formato UTC). Deve ser no presente ou no futuro.", example = "2025-08-01T19:00:00Z", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotNull(message = "A data e hora são obrigatórias.")
    @FutureOrPresent(message = "A data do jogo não pode ser no passado.")
    private Instant dateTime;
}