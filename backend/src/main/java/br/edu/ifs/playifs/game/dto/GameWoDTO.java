package br.edu.ifs.playifs.game.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Data
@Schema(description = "DTO para registar o resultado de um jogo por W.O. (Walkover).")
public class GameWoDTO {
    @Schema(description = "O ID da equipa que venceu por W.O.", example = "15", requiredMode = Schema.RequiredMode.REQUIRED)
    private Long winnerTeamId;
}