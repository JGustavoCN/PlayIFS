package br.edu.ifs.playifs.user.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Schema(description = "DTO para a atualização dos dados de um coordenador.")
public class CoordinatorUpdateDTO {

    @Schema(description = "Matrícula única do coordenador, usada para login.", example = "coord01_new", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotBlank(message = "O campo matrícula é obrigatório.")
    private String registration;

    @Schema(description = "Nome completo do coordenador.", example = "Prof. Nelio Alves da Silva", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotBlank(message = "O campo nome é obrigatório.")
    private String name;

    @Schema(description = "Email de contato do coordenador.", example = "nelio.new@ifs.edu.br", requiredMode = Schema.RequiredMode.REQUIRED)
    @Email(message = "Por favor, insira um email válido.")
    private String email;
}