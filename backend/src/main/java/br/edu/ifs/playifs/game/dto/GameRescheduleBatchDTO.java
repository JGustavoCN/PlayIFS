package br.edu.ifs.playifs.game.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotEmpty;
import lombok.Data;

import java.util.List;

@Data
@Schema(description = "DTO para a requisição de reagendamento de múltiplos jogos em massa.")
public class GameRescheduleBatchDTO {

    @Schema(description = "Lista de jogos a serem reagendados.")
    @NotEmpty(message = "A lista de reagendamentos não pode ser vazia.")
    private List<@Valid GameRescheduleItemDTO> schedules;
}