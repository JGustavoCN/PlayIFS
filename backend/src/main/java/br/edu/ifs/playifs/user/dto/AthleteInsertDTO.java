package br.edu.ifs.playifs.user.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
@Schema(description = "DTO para o cadastro de um novo atleta, incluindo a senha.")
public class AthleteInsertDTO extends AthleteDTO {

    @Schema(description = "Senha de acesso do atleta.", example = "senhaForte123")
    private String password;
}