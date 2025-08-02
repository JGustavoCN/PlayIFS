package br.edu.ifs.playifs.data.course.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotEmpty;
import lombok.Data;

import java.util.List;

@Data
@Schema(description = "DTO para a requisição de criação de múltiplos cursos em massa.")
public class CourseInputBatchDTO {

    @Schema(description = "Lista de cursos a serem criados.")
    @NotEmpty(message = "A lista de cursos não pode ser vazia.")
    private List<@Valid CourseInputDTO> courses;
}