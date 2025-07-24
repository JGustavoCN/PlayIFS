package br.edu.ifs.playifs.user.dto;

import br.edu.ifs.playifs.user.model.Athlete;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Schema(description = "DTO para representar os dados de um atleta.")
public class AthleteDTO {

    @Schema(description = "ID único do atleta.", example = "1")
    private Long id;

    @Schema(description = "Matrícula do atleta, usada para login.", example = "202301")
    private String registration;

    @Schema(description = "Nome completo do atleta.", example = "João da Silva")
    private String fullName;

    @Schema(description = "Apelido do atleta.", example = "João")
    private String nickname;

    @Schema(description = "Número de telefone para contato.", example = "79912345678")
    private String phone;

    @Schema(description = "Email do atleta.", example = "joao.silva@ifs.edu.br")
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