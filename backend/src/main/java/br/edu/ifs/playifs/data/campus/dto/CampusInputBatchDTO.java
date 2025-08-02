package br.edu.ifs.playifs.data.campus.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotEmpty;
import lombok.Data;

import java.util.List;

@Data
@Schema(description = "DTO para a requisição de criação de múltiplos campi em massa.")
public class CampusInputBatchDTO {

    @Schema(description = "Lista de campi a serem criados.")
    @NotEmpty(message = "A lista de campi não pode ser vazia.")
    private List<@Valid CampusInputDTO> campuses;
}