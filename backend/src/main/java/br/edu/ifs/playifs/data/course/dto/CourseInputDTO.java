package br.edu.ifs.playifs.data.course.dto;

import br.edu.ifs.playifs.data.course.model.enums.CourseLevel;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import lombok.Data;

@Data
@Schema(description = "DTO de entrada para criar ou atualizar um Curso.")
public class CourseInputDTO {

    @Schema(description = "Nome do curso.", example = "Informática para Internet", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotBlank(message = "O campo nome é obrigatório.")
    private String name;

    @Schema(description = "Nível do curso.", example = "INTEGRADO", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotNull(message = "O campo nível é obrigatório.")
    private CourseLevel level;

    @Schema(description = "ID do Campus ao qual o curso pertence.", example = "1", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotNull(message = "O ID do campus é obrigatório.")
    @Positive
    private Long campusId;
}