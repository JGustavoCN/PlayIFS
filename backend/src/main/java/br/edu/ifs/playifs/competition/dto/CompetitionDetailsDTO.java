package br.edu.ifs.playifs.competition.dto;

import br.edu.ifs.playifs.competition.model.Competition;
import br.edu.ifs.playifs.data.course.model.enums.CourseLevel;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Schema(description = "DTO para representar os dados detalhados de uma Competição.")
public class CompetitionDetailsDTO {

    @Schema(description = "ID único da competição.", example = "1")
    private Long id;

    @Schema(description = "Nome da competição.", example = "Jogos do Integrado 2025")
    private String name;

    @Schema(description = "Nível dos cursos que podem participar.", example = "INTEGRADO")
    private CourseLevel level;

    public CompetitionDetailsDTO(Competition entity) {
        this.id = entity.getId();
        this.name = entity.getName();
        this.level = entity.getLevel();
    }
}