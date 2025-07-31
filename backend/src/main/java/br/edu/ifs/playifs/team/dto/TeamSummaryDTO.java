package br.edu.ifs.playifs.team.dto;

import br.edu.ifs.playifs.team.model.Team;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Schema(description = "DTO para representar os dados resumidos de uma equipa, ideal para aninhamento em outros DTOs.")
public class TeamSummaryDTO {

    @Schema(description = "ID único da equipa.", example = "1")
    private Long id;

    @Schema(description = "Nome da equipa.", example = "Info Futsal PRO")
    private String name;

    public TeamSummaryDTO(Team entity) {
        this.id = entity.getId();
        this.name = entity.getName();
    }
}