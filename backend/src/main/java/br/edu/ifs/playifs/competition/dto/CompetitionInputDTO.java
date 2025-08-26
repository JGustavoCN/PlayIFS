package br.edu.ifs.playifs.competition.dto;

import br.edu.ifs.playifs.data.course.model.enums.CourseLevel;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.util.List;

@Data
@Schema(description = "DTO de entrada para criar ou atualizar uma Competição.")
public class CompetitionInputDTO {

    @Schema(description = "Nome da competição.", example = "Jogos de Verão 2025", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotBlank(message = "O campo nome é obrigatório.")
    private String name;

    @Schema(description = "Nível dos cursos que podem participar.", example = "SUPERIOR", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotNull(message = "O campo nível é obrigatório.")
    private CourseLevel level;

    // ✅ CAMPO ADICIONADO
    @Schema(description = "Lista de IDs dos desportos que farão parte desta competição.", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotEmpty(message = "A competição deve ter pelo menos um desporto associado.")
    private List<Long> sportIds;
}