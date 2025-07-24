package br.edu.ifs.playifs.data.sport.dto;

import br.edu.ifs.playifs.data.sport.model.Sport;
import io.swagger.v3.oas.annotations.media.Schema;
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
    private String name;

    @Schema(description = "Número mínimo de atletas que uma equipa deve ter.", example = "5", requiredMode = Schema.RequiredMode.REQUIRED)
    private Integer minAthletes;

    @Schema(description = "Número máximo de atletas que uma equipa pode ter.", example = "10", requiredMode = Schema.RequiredMode.REQUIRED)
    private Integer maxAthletes;

    public SportDTO(Sport entity) {
        this.id = entity.getId();
        this.name = entity.getName();
        this.minAthletes = entity.getMinAthletes();
        this.maxAthletes = entity.getMaxAthletes();
    }
}