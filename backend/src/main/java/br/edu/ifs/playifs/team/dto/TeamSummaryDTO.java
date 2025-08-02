package br.edu.ifs.playifs.team.dto;

import br.edu.ifs.playifs.team.model.Team;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.springframework.hateoas.RepresentationModel;

import java.time.Instant;

@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@Schema(description = "DTO para representar os dados resumidos de uma equipa, ideal para aninhamento em outros DTOs.")
public class TeamSummaryDTO extends RepresentationModel<TeamSummaryDTO> {
    
    @Schema(description = "ID único da equipa.", example = "1")
    private Long id;

    @Schema(description = "Nome da equipa.", example = "Info Futsal PRO")
    private String name;

    @Schema(description = "Data e hora da criação do registo.", accessMode = Schema.AccessMode.READ_ONLY)
    private Instant createdAt;

    @Schema(description = "Data e hora da última atualização do registo.", accessMode = Schema.AccessMode.READ_ONLY)
    private Instant updatedAt;

    public TeamSummaryDTO(Team entity) {
        this.id = entity.getId();
        this.name = entity.getName();
        this.createdAt = entity.getCreatedAt();
        this.updatedAt = entity.getUpdatedAt();
    }
}