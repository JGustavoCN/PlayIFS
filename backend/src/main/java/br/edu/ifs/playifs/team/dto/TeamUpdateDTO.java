package br.edu.ifs.playifs.team.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
@Schema(description = "DTO para a atualização dos dados básicos de uma equipa (ex: nome).")
public class TeamUpdateDTO {
    @Schema(description = "Novo nome para a equipa.", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotBlank(message = "O novo nome da equipa é obrigatório.")
    private String name;
}