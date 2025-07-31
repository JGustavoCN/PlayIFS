package br.edu.ifs.playifs.data.campus.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
@Schema(description = "DTO de entrada para criar ou atualizar um Campus.")
public class CampusInputDTO {

    @Schema(description = "Nome do campus.", example = "Campus Aracaju", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotBlank(message = "O campo nome é obrigatório.")
    private String name;
}