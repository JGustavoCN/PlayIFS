package br.edu.ifs.playifs.shared.web.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import lombok.Data;

import java.util.List;

@Data
@Schema(description = "DTO genérico para operações em massa que recebem uma lista de IDs.")
public class IdBatchDTO {

    @Schema(description = "Lista de IDs dos recursos a serem afetados pela operação.", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotEmpty(message = "A lista de IDs não pode ser vazia.")
    private List<@NotNull @Positive Long> ids;
}   