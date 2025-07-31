package br.edu.ifs.playifs.data.sport.dto;

import br.edu.ifs.playifs.data.sport.model.Sport;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "DTO para representar os dados de um Desporto.")
public class SportDTO {

    @Schema(description = "ID único do desporto.", example = "1", accessMode = Schema.AccessMode.READ_ONLY)
    private Long id;

    @Schema(description = "Nome do desporto.", example = "Futsal", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotBlank(message = "O campo nome é obrigatório.")
    private String name;

    @Schema(description = "Número mínimo de atletas que uma equipa deve ter.", example = "5", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotNull(message = "O número mínimo de atletas é obrigatório.")
    @Positive(message = "O número mínimo de atletas deve ser um número positivo.")
    private Integer minAthletes;

    @Schema(description = "Número máximo de atletas que uma equipa pode ter.", example = "10", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotNull(message = "O número máximo de atletas é obrigatório.")
    @Positive(message = "O número máximo de atletas deve ser um número positivo.")
    private Integer maxAthletes;

    public SportDTO(Sport entity) {
        this.id = entity.getId();
        this.name = entity.getName();
        this.minAthletes = entity.getMinAthletes();
        this.maxAthletes = entity.getMaxAthletes();
    }
}