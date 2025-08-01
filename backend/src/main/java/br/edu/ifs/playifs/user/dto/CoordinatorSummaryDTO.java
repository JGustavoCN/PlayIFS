package br.edu.ifs.playifs.user.dto;

import br.edu.ifs.playifs.user.model.Coordinator;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.Instant;

@Data
@NoArgsConstructor
@Schema(description = "DTO para representar os dados resumidos de um Coordenador, ideal para listagens.")
public class CoordinatorSummaryDTO {

    @Schema(description = "ID único do perfil do coordenador.", example = "1")
    private Long id;

    @Schema(description = "Matrícula única do coordenador.", example = "coord01")
    private String registration;

    @Schema(description = "Nome completo do coordenador.", example = "Prof. Nelio Alves")
    private String name;

    @Schema(description = "Data e hora da criação do registo.", accessMode = Schema.AccessMode.READ_ONLY)
    private Instant createdAt;

    @Schema(description = "Data e hora da última atualização do registo.", accessMode = Schema.AccessMode.READ_ONLY)
    private Instant updatedAt;

    public CoordinatorSummaryDTO(Coordinator entity) {
        this.id = entity.getId();
        this.registration = entity.getUser().getRegistration();
        this.name = entity.getName();
        this.createdAt = entity.getCreatedAt();
        this.updatedAt = entity.getUpdatedAt();
    }
}