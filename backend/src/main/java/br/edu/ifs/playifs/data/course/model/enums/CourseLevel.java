package br.edu.ifs.playifs.data.course.model.enums;

import io.swagger.v3.oas.annotations.media.Schema;

@Schema(description = "Nível do curso oferecido pela instituição")
public enum CourseLevel {

    @Schema(description = "Curso técnico integrado ao ensino médio")
    INTEGRADO,

    @Schema(description = "Curso técnico subsequente ou concomitante")
    TECNICO,

    @Schema(description = "Curso de nível superior (graduação)")
    SUPERIOR;
}
