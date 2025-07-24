package br.edu.ifs.playifs.game.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import java.time.Instant;

@Data
@Schema(description = "DTO para atualizar a data e a hora de um jogo agendado.")
public class GameUpdateDTO {
    @Schema(description = "A nova data e hora para o jogo.", requiredMode = Schema.RequiredMode.REQUIRED)
    private Instant dateTime;
}