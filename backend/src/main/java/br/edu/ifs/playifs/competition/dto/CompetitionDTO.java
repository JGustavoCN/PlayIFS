package br.edu.ifs.playifs.competition.dto;

import br.edu.ifs.playifs.competition.model.Competition;
import br.edu.ifs.playifs.data.course.model.enums.CourseLevel;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "DTO para representar os dados de uma Competição.")
public class CompetitionDTO {

    @Schema(description = "ID único da competição.", example = "1", accessMode = Schema.AccessMode.READ_ONLY)
    private Long id;

    @Schema(description = "Nome da competição.", example = "Jogos do Integrado 2025", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotBlank(message = "O campo nome é obrigatório.")
    private String name;

    @Schema(description = "Nível dos cursos que podem participar.", example = "INTEGRADO", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotNull(message = "O campo nível é obrigatório.")
    private CourseLevel level;

    public CompetitionDTO(Competition entity) {
        this.id = entity.getId();
        this.name = entity.getName();
        this.level = entity.getLevel();
    }
}