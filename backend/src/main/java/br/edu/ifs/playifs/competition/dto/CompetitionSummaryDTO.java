package br.edu.ifs.playifs.competition.dto;

import br.edu.ifs.playifs.competition.model.Competition;
import br.edu.ifs.playifs.data.course.model.enums.CourseLevel;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.Instant;

@Data
@NoArgsConstructor
@Schema(description = "DTO para representar os dados resumidos de uma Competição, ideal para listagens.")
public class CompetitionSummaryDTO {

    @Schema(description = "ID único da competição.", example = "1")
    private Long id;

    @Schema(description = "Nome da competição.", example = "Jogos do Integrado 2025")
    private String name;

    @Schema(description = "Nível dos cursos que podem participar.", example = "INTEGRADO")
    private CourseLevel level;

    @Schema(description = "Data e hora da criação do registo.", accessMode = Schema.AccessMode.READ_ONLY)
    private Instant createdAt;

    @Schema(description = "Data e hora da última atualização do registo.", accessMode = Schema.AccessMode.READ_ONLY)
    private Instant updatedAt;

    public CompetitionSummaryDTO(Competition entity) {
        this.id = entity.getId();
        this.name = entity.getName();
        this.level = entity.getLevel();
        this.createdAt = entity.getCreatedAt();
        this.updatedAt = entity.getUpdatedAt();
    }
}