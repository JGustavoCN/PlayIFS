package br.edu.ifs.playifs.user.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.Size;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
@Schema(description = "DTO para o cadastro de um novo atleta, incluindo a senha.")
public class AthleteInsertDTO extends AthleteDTO {

    @Schema(description = "Senha de acesso do atleta.", requiredMode = Schema.RequiredMode.REQUIRED)
    @Size(min = 6, message = "A senha deve ter no mínimo 6 caracteres.")
    private String password;
}