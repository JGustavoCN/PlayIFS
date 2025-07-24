package br.edu.ifs.playifs.competition.dto;

import br.edu.ifs.playifs.competition.model.DesignatedCoach;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Schema(description = "DTO para designar um atleta como técnico para uma vaga específica (competição, desporto, curso).")
public class DesignatedCoachDTO {

    @Schema(description = "ID do desporto.", requiredMode = Schema.RequiredMode.REQUIRED, example = "1")
    private Long sportId;

    @Schema(description = "ID do curso.", requiredMode = Schema.RequiredMode.REQUIRED, example = "1")
    private Long courseId;

    @Schema(description = "ID do atleta que será o técnico.", requiredMode = Schema.RequiredMode.REQUIRED, example = "1")
    private Long athleteId;

    @Schema(description = "ID da competição.", requiredMode = Schema.RequiredMode.REQUIRED, example = "1")
    private Long competitionId;

    public DesignatedCoachDTO(DesignatedCoach entity) {
        this.sportId = entity.getSport().getId();
        this.courseId = entity.getCourse().getId();
        this.athleteId = entity.getCoach().getId();
        this.competitionId = entity.getCompetition().getId();
    }
}