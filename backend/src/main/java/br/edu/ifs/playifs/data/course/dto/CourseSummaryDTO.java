package br.edu.ifs.playifs.data.course.dto;

import br.edu.ifs.playifs.data.course.model.Course;
import br.edu.ifs.playifs.data.course.model.enums.CourseLevel;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.springframework.hateoas.RepresentationModel;

import java.time.Instant;

@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@Schema(description = "DTO para representar os dados resumidos de um Curso, ideal para listagens.")
public class CourseSummaryDTO extends RepresentationModel<CourseSummaryDTO> {

    @Schema(description = "ID único do curso.", example = "1")
    private Long id;

    @Schema(description = "Nome do curso.", example = "Informática para Internet")
    private String name;

    @Schema(description = "Nível do curso.", example = "INTEGRADO")
    private CourseLevel level;

    @Schema(description = "Nome do campus ao qual o curso pertence.", example = "Campus Aracaju")
    private String campusName;

    @Schema(description = "Data e hora da criação do registo.", accessMode = Schema.AccessMode.READ_ONLY)
    private Instant createdAt;

    @Schema(description = "Data e hora da última atualização do registo.", accessMode = Schema.AccessMode.READ_ONLY)
    private Instant updatedAt;

    public CourseSummaryDTO(Course entity) {
        this.id = entity.getId();
        this.name = entity.getName();
        this.level = entity.getLevel();
        this.campusName = entity.getCampus().getName();
        this.createdAt = entity.getCreatedAt();
        this.updatedAt = entity.getUpdatedAt();
    }
}