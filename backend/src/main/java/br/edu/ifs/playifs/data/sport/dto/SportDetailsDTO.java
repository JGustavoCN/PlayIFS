package br.edu.ifs.playifs.data.sport.dto;

import br.edu.ifs.playifs.data.sport.model.Sport;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Schema(description = "DTO para representar os dados detalhados de um Desporto.")
public class SportDetailsDTO {

    @Schema(description = "ID único do desporto.", example = "1", accessMode = Schema.AccessMode.READ_ONLY)
    private Long id;

    @Schema(description = "Nome do desporto.", example = "Futsal")
    private String name;

    @Schema(description = "Número mínimo de atletas que uma equipa deve ter.", example = "5")
    private Integer minAthletes;

    @Schema(description = "Número máximo de atletas que uma equipa pode ter.", example = "10")
    private Integer maxAthletes;

    public SportDetailsDTO(Sport entity) {
        this.id = entity.getId();
        this.name = entity.getName();
        this.minAthletes = entity.getMinAthletes();
        this.maxAthletes = entity.getMaxAthletes();
    }
}