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
@Schema(description = "DTO para representar os dados resumidos de um atleta, ideal para listagens.")
public class AthleteSummaryDTO extends RepresentationModel<AthleteSummaryDTO> {

    @Schema(description = "ID único do perfil do atleta.", example = "1")
    private Long id;

    @Schema(description = "Matrícula única do atleta.", example = "202301")
    private String registration;

    @Schema(description = "Nome completo do atleta.", example = "José da Silva")
    private String fullName;

    @Schema(description = "Data e hora da criação do registo.", accessMode = Schema.AccessMode.READ_ONLY)
    private Instant createdAt;

    @Schema(description = "Data e hora da última atualização do registo.", accessMode = Schema.AccessMode.READ_ONLY)
    private Instant updatedAt;

    public AthleteSummaryDTO(Athlete entity) {
        this.id = entity.getId();
        this.registration = entity.getUser().getRegistration();
        this.fullName = entity.getFullName();
        this.createdAt = entity.getCreatedAt();
        this.updatedAt = entity.getUpdatedAt();
    }
}