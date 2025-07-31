package br.edu.ifs.playifs.user.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Schema(description = "DTO para a atualização dos dados de um atleta.")
public class AthleteUpdateDTO {

    @Schema(description = "Matrícula única do atleta, usada para login.", example = "202301", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotBlank(message = "O campo matrícula é obrigatório.")
    private String registration;

    @Schema(description = "Nome completo do atleta.", example = "José da Silva Atualizado", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotBlank(message = "O campo nome completo é obrigatório.")
    private String fullName;

    @Schema(description = "Apelido do atleta.", example = "Zé Atualizado")
    private String nickname;

    @Schema(description = "Telefone de contato do atleta.", example = "79991234567")
    private String phone;

    @Schema(description = "Email do atleta.", example = "jose.silva.novo@email.com", requiredMode = Schema.RequiredMode.REQUIRED)
    @Email(message = "Por favor, insira um email válido.")
    private String email;
}