package br.edu.ifs.playifs.game.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotEmpty;
import lombok.Data;
import java.util.List;

@Data
@Schema(description = "DTO para a requisição de atualização de resultados de múltiplos jogos em massa.")
public class GameResultBatchDTO {

    @Schema(description = "Lista de resultados de jogos a serem atualizados.")
    @NotEmpty(message = "A lista de resultados não pode ser vazia.")
    private List<@Valid GameResultItemDTO> results;
}