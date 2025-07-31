package br.edu.ifs.playifs.competition.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import lombok.Data;

@Data
@Schema(description = "DTO para definir ou atualizar a designação de um atleta como técnico.")
public class DesignatedCoachInputDTO {

    @Schema(description = "ID da Competição.", requiredMode = Schema.RequiredMode.REQUIRED, example = "1")
    @NotNull(message = "O ID da competição é obrigatório.")
    @Positive
    private Long competitionId;

    @Schema(description = "ID do Desporto.", requiredMode = Schema.RequiredMode.REQUIRED, example = "2")
    @NotNull(message = "O ID do desporto é obrigatório.")
    @Positive
    private Long sportId;

    @Schema(description = "ID do Curso.", requiredMode = Schema.RequiredMode.REQUIRED, example = "2")
    @NotNull(message = "O ID do curso é obrigatório.")
    @Positive
    private Long courseId;

    @Schema(description = "ID do Atleta que será o técnico.", requiredMode = Schema.RequiredMode.REQUIRED, example = "6")
    @NotNull(message = "O ID do atleta é obrigatório.")
    @Positive
    private Long athleteId;
}