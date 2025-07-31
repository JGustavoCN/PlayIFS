package br.edu.ifs.playifs.data.sport.dto;

import br.edu.ifs.playifs.data.sport.model.Sport;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Schema(description = "DTO para representar os dados resumidos de um Desporto, ideal para listagens.")
public class SportSummaryDTO {

    @Schema(description = "ID único do desporto.", example = "1")
    private Long id;

    @Schema(description = "Nome do desporto.", example = "Futsal")
    private String name;

    public SportSummaryDTO(Sport entity) {
        this.id = entity.getId();
        this.name = entity.getName();
    }
}