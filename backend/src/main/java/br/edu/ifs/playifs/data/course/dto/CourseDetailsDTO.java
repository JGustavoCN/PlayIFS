package br.edu.ifs.playifs.data.course.dto;

import br.edu.ifs.playifs.data.campus.dto.CampusSummaryDTO; // Importação correta
import br.edu.ifs.playifs.data.course.model.Course;
import br.edu.ifs.playifs.data.course.model.enums.CourseLevel;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Schema(description = "DTO para representar os dados detalhados de um Curso.")
public class CourseDetailsDTO {

    @Schema(description = "ID único do curso.", example = "1", accessMode = Schema.AccessMode.READ_ONLY)
    private Long id;

    @Schema(description = "Nome do curso.", example = "Informática para Internet")
    private String name;

    @Schema(description = "Nível do curso.", example = "INTEGRADO")
    private CourseLevel level;

    @Schema(description = "Campus ao qual o curso pertence (versão resumida).")
    private CampusSummaryDTO campus;

    public CourseDetailsDTO(Course entity) {
        this.id = entity.getId();
        this.name = entity.getName();
        this.level = entity.getLevel();
        this.campus = new CampusSummaryDTO(entity.getCampus());
    }
}