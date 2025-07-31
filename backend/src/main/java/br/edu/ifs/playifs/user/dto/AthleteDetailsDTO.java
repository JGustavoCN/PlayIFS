package br.edu.ifs.playifs.user.dto;

import br.edu.ifs.playifs.user.model.Athlete;
import io.swagger.v3.oas.annotations.media.Schema;
// Importações de validação removidas (jakarta.validation.constraints.Email, jakarta.validation.constraints.NotBlank)
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Schema(description = "DTO para representar os dados detalhados de um atleta.") // Descrição atualizada
public class AthleteDetailsDTO { // Renomeado de AthleteDTO

    @Schema(description = "ID único do perfil do atleta.", example = "1", accessMode = Schema.AccessMode.READ_ONLY)
    private Long id;

    @Schema(description = "Matrícula única do atleta, usada para login.", example = "202301") // Validação removida
    private String registration;

    @Schema(description = "Nome completo do atleta.", example = "José da Silva") // Validação removida
    private String fullName;

    @Schema(description = "Apelido do atleta.", example = "Zé")
    private String nickname;

    @Schema(description = "Telefone de contato do atleta.", example = "79998765432")
    private String phone;

    @Schema(description = "Email do atleta.", example = "jose.silva@email.com") // Validação removida
    private String email;

    public AthleteDetailsDTO(Athlete entity) {
        id = entity.getId();
        registration = entity.getUser().getRegistration();
        fullName = entity.getFullName();
        nickname = entity.getNickname();
        phone = entity.getPhone();
        email = entity.getEmail();
    }
}