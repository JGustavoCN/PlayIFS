package br.edu.ifs.playifs.data.sport.dto;

import br.edu.ifs.playifs.data.sport.model.Sport;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.Instant;

@Data
@NoArgsConstructor
@Schema(description = "DTO para representar os dados resumidos de um Desporto, ideal para listagens.")
public class SportSummaryDTO {

    @Schema(description = "ID único do desporto.", example = "1")
    private Long id;

    @Schema(description = "Nome do desporto.", example = "Futsal")
    private String name;

    @Schema(description = "Data e hora da criação do registo.", example = "2023-01-01T10:00:00Z", accessMode = Schema.AccessMode.READ_ONLY)
    private Instant createdAt;

    @Schema(description = "Data e hora da última atualização do registo.", example = "2023-01-01T10:30:00Z", accessMode = Schema.AccessMode.READ_ONLY)
    private Instant updatedAt;

    public SportSummaryDTO(Sport entity) {
        this.id = entity.getId();
        this.name = entity.getName();
        this.createdAt = entity.getCreatedAt();
        this.updatedAt = entity.getUpdatedAt();
    }
}