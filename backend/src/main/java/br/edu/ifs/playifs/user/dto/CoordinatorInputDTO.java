package br.edu.ifs.playifs.user.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Data
@Schema(description = "DTO para o cadastro de um novo coordenador, incluindo a senha.")
public class CoordinatorInputDTO { // Não estende mais CoordinatorDetailsDTO (antigo CoordinatorDTO)

    @Schema(description = "Matrícula única do coordenador, usada para login.", example = "coord01", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotBlank(message = "O campo matrícula é obrigatório.")
    private String registration;

    @Schema(description = "Nome completo do coordenador.", example = "Prof. Nelio Alves", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotBlank(message = "O campo nome é obrigatório.")
    private String name;

    @Schema(description = "Email de contato do coordenador.", example = "nelio.alves@ifs.edu.br", requiredMode = Schema.RequiredMode.REQUIRED)
    @Email(message = "Por favor, insira um email válido.")
    private String email;

    @Schema(description = "Senha de acesso do coordenador.", example = "senhaSuperSegura456", requiredMode = Schema.RequiredMode.REQUIRED)
    @Size(min = 6, message = "A senha deve ter no mínimo 6 caracteres.")
    private String password;
}