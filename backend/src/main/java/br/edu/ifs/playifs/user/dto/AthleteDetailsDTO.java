package br.edu.ifs.playifs.user.dto;

import br.edu.ifs.playifs.user.model.Athlete;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.springframework.hateoas.RepresentationModel;

import java.time.Instant;

@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@Schema(description = "DTO para representar os dados detalhados de um atleta.")
public class AthleteDetailsDTO extends RepresentationModel<AthleteDetailsDTO> {

    @Schema(description = "ID único do perfil do atleta.", example = "1")
    private Long id;

    @Schema(description = "Matrícula única do atleta, usada para login.", example = "202301")
    private String registration;

    @Schema(description = "Nome completo do atleta.", example = "José da Silva")
    private String fullName;

    @Schema(description = "Apelido do atleta.", example = "Zé")
    private String nickname;

    @Schema(description = "Telefone de contato do atleta.", example = "79998765432")
    private String phone;

    @Schema(description = "Email do atleta.", example = "jose.silva@email.com")
    private String email;

    @Schema(description = "Indica se este atleta é também um técnico designado de alguma equipa.", example = "true")
    private boolean isCoach;

    @Schema(description = "Data e hora da criação do registo.", accessMode = Schema.AccessMode.READ_ONLY)
    private Instant createdAt;

    @Schema(description = "Data e hora da última atualização do registo.", accessMode = Schema.AccessMode.READ_ONLY)
    private Instant updatedAt;

    public AthleteDetailsDTO(Athlete entity) {
        this.id = entity.getId();
        this.registration = entity.getUser().getRegistration();
        this.fullName = entity.getFullName();
        this.nickname = entity.getNickname();
        this.phone = entity.getPhone();
        this.email = entity.getEmail();
        this.createdAt = entity.getCreatedAt();
        this.updatedAt = entity.getUpdatedAt();
    }

    public AthleteDetailsDTO(Athlete entity, boolean isCoach) {
        this(entity);
        this.isCoach = isCoach;
    }
}