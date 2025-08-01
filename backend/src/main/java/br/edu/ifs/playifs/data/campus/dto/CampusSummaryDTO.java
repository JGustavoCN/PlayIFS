package br.edu.ifs.playifs.data.campus.dto;

import br.edu.ifs.playifs.data.campus.model.Campus;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.Instant;

@Data
@NoArgsConstructor
@Schema(description = "DTO para representar os dados resumidos de um Campus, ideal para listagens.")
public class CampusSummaryDTO {

    @Schema(description = "ID único do campus.", example = "1")
    private Long id;

    @Schema(description = "Nome do campus.", example = "Campus Aracaju")
    private String name;

    @Schema(description = "Data e hora da criação do registo.", example = "2023-01-01T10:00:00Z", accessMode = Schema.AccessMode.READ_ONLY)
    private Instant createdAt;

    @Schema(description = "Data e hora da última atualização do registo.", example = "2023-01-01T10:30:00Z", accessMode = Schema.AccessMode.READ_ONLY)
    private Instant updatedAt;

    public CampusSummaryDTO(Campus entity) {
        this.id = entity.getId();
        this.name = entity.getName();
        this.createdAt = entity.getCreatedAt();
        this.updatedAt = entity.getUpdatedAt();
    }
}