package br.edu.ifs.playifs.user.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
@Schema(description = "DTO para o cadastro de um novo coordenador, incluindo a senha.")
public class CoordinatorInsertDTO extends CoordinatorDTO {

    @Schema(description = "Senha de acesso para o novo coordenador.", example = "senhaSegura456", requiredMode = Schema.RequiredMode.REQUIRED)
    private String password;
}