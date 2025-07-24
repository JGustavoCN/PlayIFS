package br.edu.ifs.playifs.data.course.dto;

import br.edu.ifs.playifs.data.campus.dto.CampusDTO;
import br.edu.ifs.playifs.data.course.model.Course;
import br.edu.ifs.playifs.data.course.model.enums.CourseLevel;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "DTO para representar os dados de um Curso.")
public class CourseDTO {

    @Schema(description = "ID único do curso.", example = "1")
    private Long id;

    @Schema(description = "Nome do curso.", example = "Técnico em Informática", requiredMode = Schema.RequiredMode.REQUIRED)
    private String name;

    @Schema(description = "Nível do curso.", example = "INTEGRADO", requiredMode = Schema.RequiredMode.REQUIRED)
    private CourseLevel level;

    @Schema(description = "Campus ao qual o curso pertence.", requiredMode = Schema.RequiredMode.REQUIRED)
    private CampusDTO campus;

    public CourseDTO(Course entity) {
        this.id = entity.getId();
        this.name = entity.getName();
        this.level = entity.getLevel();
        this.campus = new CampusDTO(entity.getCampus());
    }
}