package br.edu.ifs.playifs.competition.dto;

import br.edu.ifs.playifs.competition.model.Competition;
import br.edu.ifs.playifs.competition.model.enums.CompetitionStatus; // 1. Importar o Enum de Status
import br.edu.ifs.playifs.data.course.model.enums.CourseLevel;
import br.edu.ifs.playifs.data.sport.dto.SportSummaryDTO; // 2. Importar o DTO de Desporto
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.springframework.hateoas.RepresentationModel;

import java.time.Instant;
import java.util.List; // 3. Importar List
import java.util.stream.Collectors; // 4. Importar Collectors

@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@Schema(description = "DTO para representar os dados detalhados de uma Competição.")
public class CompetitionDetailsDTO extends RepresentationModel<CompetitionDetailsDTO> {

    @Schema(description = "ID único da competição.", example = "1")
    private Long id;

    @Schema(description = "Nome da competição.", example = "Jogos do Integrado 2025")
    private String name;

    @Schema(description = "Nível dos cursos que podem participar.", example = "INTEGRADO")
    private CourseLevel level;

    // 5. ADICIONADO: Campo de status, necessário para a UI.
    @Schema(description = "O status atual da competição.", example = "OPEN_FOR_REGISTRATION")
    private CompetitionStatus status;

    // 6. ADICIONADO: Lista de desportos associados, necessária para a UI.
    @Schema(description = "Lista de desportos que fazem parte desta competição.")
    private List<SportSummaryDTO> associatedSports;

    @Schema(description = "Data e hora da criação do registo.", accessMode = Schema.AccessMode.READ_ONLY)
    private Instant createdAt;

    @Schema(description = "Data e hora da última atualização do registo.", accessMode = Schema.AccessMode.READ_ONLY)
    private Instant updatedAt;

    public CompetitionDetailsDTO(Competition entity) {
        this.id = entity.getId();
        this.name = entity.getName();
        this.level = entity.getLevel();
        this.createdAt = entity.getCreatedAt();
        this.updatedAt = entity.getUpdatedAt();

        // 7. Mapear os novos campos da entidade para o DTO
        this.status = entity.getStatus();
        this.associatedSports = entity.getSports().stream()
                .map(SportSummaryDTO::new)
                .collect(Collectors.toList());
    }
}