package br.edu.ifs.playifs.game.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import lombok.Data;

@Data
@Schema(description = "DTO para registrar um resultado de W.O. (Walkover).")
public class GameWoDTO {
    @Schema(description = "ID da equipa que venceu por W.O.", example = "1", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotNull(message = "O ID da equipa vencedora é obrigatório.")
    @Positive(message = "O ID da equipa deve ser um número positivo.")
    private Long winnerTeamId;
}