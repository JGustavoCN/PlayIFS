package br.edu.ifs.playifs.user.dto;

import br.edu.ifs.playifs.user.model.Athlete;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Schema(description = "DTO para representar ou atualizar os dados de um atleta.")
public class AthleteDTO {

    @Schema(description = "ID único do perfil do atleta.", accessMode = Schema.AccessMode.READ_ONLY)
    private Long id;

    @Schema(description = "Matrícula única do atleta, usada para login.", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotBlank(message = "O campo matrícula é obrigatório.")
    private String registration;

    @Schema(description = "Nome completo do atleta.", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotBlank(message = "O campo nome completo é obrigatório.")
    private String fullName;

    private String nickname;
    private String phone;

    @Schema(description = "Email do atleta.", requiredMode = Schema.RequiredMode.REQUIRED)
    @Email(message = "Por favor, insira um email válido.")
    private String email;

    public AthleteDTO(Athlete entity) {
        id = entity.getId();
        registration = entity.getUser().getRegistration();
        fullName = entity.getFullName();
        nickname = entity.getNickname();
        phone = entity.getPhone();
        email = entity.getEmail();
    }
}