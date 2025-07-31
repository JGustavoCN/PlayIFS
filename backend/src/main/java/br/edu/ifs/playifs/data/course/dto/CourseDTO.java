package br.edu.ifs.playifs.data.course.dto;

import br.edu.ifs.playifs.data.campus.dto.CampusDTO;
import br.edu.ifs.playifs.data.course.model.Course;
import br.edu.ifs.playifs.data.course.model.enums.CourseLevel;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "DTO para representar os dados de um Curso.")
public class CourseDTO {

    @Schema(description = "ID único do curso.", example = "1", accessMode = Schema.AccessMode.READ_ONLY)
    private Long id;

    @Schema(description = "Nome do curso.", example = "Informática para Internet", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotBlank(message = "O campo nome é obrigatório.")
    private String name;

    @Schema(description = "Nível do curso.", example = "INTEGRADO", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotNull(message = "O campo nível é obrigatório.")
    private CourseLevel level;

    @Schema(description = "Campus ao qual o curso pertence.", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotNull(message = "O campo campus é obrigatório.")
    @Valid // Garante que as validações dentro de CampusDTO (se houver) também sejam aplicadas.
    private CampusDTO campus;

    public CourseDTO(Course entity) {
        this.id = entity.getId();
        this.name = entity.getName();
        this.level = entity.getLevel();
        this.campus = new CampusDTO(entity.getCampus());
    }
}