package br.edu.ifs.playifs.data.campus.dto;

import br.edu.ifs.playifs.data.campus.model.Campus;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Schema(description = "DTO para representar os dados detalhados de um Campus.")
public class CampusDetailsDTO {

    @Schema(description = "ID único do campus.", example = "1")
    private Long id;

    @Schema(description = "Nome do campus.", example = "Campus Aracaju")
    private String name;

    public CampusDetailsDTO(Campus entity) {
        this.id = entity.getId();
        this.name = entity.getName();
    }
}