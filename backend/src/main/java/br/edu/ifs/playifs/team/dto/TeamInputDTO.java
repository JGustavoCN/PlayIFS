package br.edu.ifs.playifs.team.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import lombok.Data;
import java.util.List;

@Data
@Schema(description = "DTO para a criação de uma nova equipa.")
public class TeamInputDTO {

    @Schema(description = "Nome da equipa.", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotBlank(message = "O nome da equipa é obrigatório.")
    private String name;

    @Schema(description = "ID do Curso.", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotNull(message = "O ID do Curso é obrigatório.")
    @Positive
    private Long courseId;

    @Schema(description = "ID do Desporto.", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotNull(message = "O ID do Desporto é obrigatório.")
    @Positive
    private Long sportId;

    @Schema(description = "ID da Competição.", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotNull(message = "O ID da Competição é obrigatório.")
    @Positive
    private Long competitionId;

    @Schema(description = "ID do Técnico.", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotNull(message = "O ID do Técnico é obrigatório.")
    @Positive
    private Long coachId;

    @Schema(description = "Lista de IDs dos atletas.", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotEmpty(message = "A lista de atletas não pode ser vazia.")
    private List<@NotNull @Positive Long> athleteIds;
}