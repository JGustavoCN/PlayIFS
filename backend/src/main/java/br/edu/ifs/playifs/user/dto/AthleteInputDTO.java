package br.edu.ifs.playifs.user.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Data;
// lombok.EqualsAndHashCode removido
// extends AthleteDTO removido

@Data
@Schema(description = "DTO para o cadastro de um novo atleta, incluindo a senha.")
public class AthleteInputDTO { // Não estende mais AthleteDetailsDTO (antigo AthleteDTO)

    @Schema(description = "Matrícula única do atleta, usada para login.", example = "202301", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotBlank(message = "O campo matrícula é obrigatório.")
    private String registration;

    @Schema(description = "Nome completo do atleta.", example = "José da Silva", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotBlank(message = "O campo nome completo é obrigatório.")
    private String fullName;

    @Schema(description = "Apelido do atleta.", example = "Zé")
    private String nickname;

    @Schema(description = "Telefone de contato do atleta.", example = "79998765432")
    private String phone;

    @Schema(description = "Email do atleta.", example = "jose.silva@email.com", requiredMode = Schema.RequiredMode.REQUIRED)
    @Email(message = "Por favor, insira um email válido.")
    private String email;

    @Schema(description = "Senha de acesso do atleta.", requiredMode = Schema.RequiredMode.REQUIRED)
    @Size(min = 6, message = "A senha deve ter no mínimo 6 caracteres.")
    private String password;
}