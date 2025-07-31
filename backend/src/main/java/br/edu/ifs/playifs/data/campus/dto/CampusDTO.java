package br.edu.ifs.playifs.data.campus.dto;

import br.edu.ifs.playifs.data.campus.model.Campus;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "DTO para representar os dados de um Campus do IFS.")
public class CampusDTO {

    @Schema(description = "ID único do campus.", example = "1", accessMode = Schema.AccessMode.READ_ONLY)
    private Long id;

    @Schema(description = "Nome do campus.", example = "Campus Aracaju", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotBlank(message = "O campo nome é obrigatório.")
    private String name;

    public CampusDTO(Campus entity) {
        this.id = entity.getId();
        this.name = entity.getName();
    }
}