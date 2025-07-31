package br.edu.ifs.playifs.data.course.dto;

import br.edu.ifs.playifs.data.course.model.Course;
import br.edu.ifs.playifs.data.course.model.enums.CourseLevel;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Schema(description = "DTO para representar os dados resumidos de um Curso, ideal para listagens.")
public class CourseSummaryDTO {

    @Schema(description = "ID único do curso.", example = "1")
    private Long id;

    @Schema(description = "Nome do curso.", example = "Informática para Internet")
    private String name;

    @Schema(description = "Nível do curso.", example = "INTEGRADO")
    private CourseLevel level;

    @Schema(description = "Nome do campus ao qual o curso pertence.", example = "Campus Aracaju")
    private String campusName;

    public CourseSummaryDTO(Course entity) {
        this.id = entity.getId();
        this.name = entity.getName();
        this.level = entity.getLevel();
        this.campusName = entity.getCampus().getName();
    }
}