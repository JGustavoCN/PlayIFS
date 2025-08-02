package br.edu.ifs.playifs.data.sport.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotEmpty;
import lombok.Data;

import java.util.List;

@Data
@Schema(description = "DTO para a requisição de criação de múltiplos desportos em massa.")
public class SportInputBatchDTO {

    @Schema(description = "Lista de desportos a serem criados.")
    @NotEmpty(message = "A lista de desportos não pode ser vazia.")
    private List<@Valid SportInputDTO> sports;
}