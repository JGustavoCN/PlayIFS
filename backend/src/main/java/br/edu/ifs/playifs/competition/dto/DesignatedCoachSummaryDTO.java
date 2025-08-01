package br.edu.ifs.playifs.competition.dto;

import br.edu.ifs.playifs.competition.model.DesignatedCoach;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.Instant;

@Data
@NoArgsConstructor
@Schema(description = "DTO para representar os dados resumidos de um técnico designado.")
public class DesignatedCoachSummaryDTO {

    @Schema(description = "ID único da designação.", example = "1")
    private Long id;
    @Schema(description = "Nome do atleta designado como técnico.", example = "Ana Costa")
    private String athleteName;
    @Schema(description = "Nome do desporto.", example = "Voleibol")
    private String sportName;
    @Schema(description = "Nome do curso.", example = "Edificações")
    private String courseName;
    @Schema(description = "Nome da competição.", example = "Jogos do Integrado 2025")
    private String competitionName;

    @Schema(description = "Data e hora da criação do registo.", accessMode = Schema.AccessMode.READ_ONLY)
    private Instant createdAt;

    @Schema(description = "Data e hora da última atualização do registo.", accessMode = Schema.AccessMode.READ_ONLY)
    private Instant updatedAt;

    public DesignatedCoachSummaryDTO(DesignatedCoach entity) {
        this.id = entity.getId();
        this.athleteName = entity.getCoach().getFullName();
        this.sportName = entity.getSport().getName();
        this.courseName = entity.getCourse().getName();
        this.competitionName = entity.getCompetition().getName();
        this.createdAt = entity.getCreatedAt();
        this.updatedAt = entity.getUpdatedAt();
    }
}