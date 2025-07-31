package br.edu.ifs.playifs.competition.dto;

import br.edu.ifs.playifs.competition.model.DesignatedCoach;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Schema(description = "DTO para definir ou atualizar a designação de um atleta como técnico para uma vaga específica.")
public class DesignatedCoachDTO {

    @Schema(description = "ID da Competição.", requiredMode = Schema.RequiredMode.REQUIRED, example = "1")
    @NotNull(message = "O ID da competição é obrigatório.")
    @Positive(message = "O ID da competição deve ser um número positivo.")
    private Long competitionId;

    @Schema(description = "ID do Desporto.", requiredMode = Schema.RequiredMode.REQUIRED, example = "1")
    @NotNull(message = "O ID do desporto é obrigatório.")
    @Positive(message = "O ID do desporto deve ser um número positivo.")
    private Long sportId;

    @Schema(description = "ID do Curso.", requiredMode = Schema.RequiredMode.REQUIRED, example = "1")
    @NotNull(message = "O ID do curso é obrigatório.")
    @Positive(message = "O ID do curso deve ser um número positivo.")
    private Long courseId;

    @Schema(description = "ID do Atleta que será o técnico.", requiredMode = Schema.RequiredMode.REQUIRED, example = "6")
    @NotNull(message = "O ID do atleta é obrigatório.")
    @Positive(message = "O ID do atleta deve ser um número positivo.")
    private Long athleteId;

    public DesignatedCoachDTO(DesignatedCoach entity) {
        this.competitionId = entity.getCompetition().getId();
        this.sportId = entity.getSport().getId();
        this.courseId = entity.getCourse().getId();
        this.athleteId = entity.getCoach().getId();
    }
}