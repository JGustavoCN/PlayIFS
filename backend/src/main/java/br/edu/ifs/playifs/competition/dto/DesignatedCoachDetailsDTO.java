package br.edu.ifs.playifs.competition.dto;

import br.edu.ifs.playifs.competition.model.DesignatedCoach;
import br.edu.ifs.playifs.data.course.dto.CourseSummaryDTO;
import br.edu.ifs.playifs.data.sport.dto.SportSummaryDTO;
import br.edu.ifs.playifs.user.dto.AthleteDetailsDTO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.springframework.hateoas.RepresentationModel;

import java.time.Instant;

@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@Schema(description = "DTO para representar os dados detalhados de uma designação de técnico.")
public class DesignatedCoachDetailsDTO extends RepresentationModel<DesignatedCoachDetailsDTO> {

    @Schema(description = "ID único da designação.", example = "1")
    private Long id;

    @Schema(description = "Detalhes da competição à qual a designação pertence.")
    private CompetitionSummaryDTO competition;

    @Schema(description = "Detalhes do desporto ao qual a designação pertence.")
    private SportSummaryDTO sport;

    @Schema(description = "Detalhes do curso ao qual a designação pertence.")
    private CourseSummaryDTO course;

    @Schema(description = "Detalhes do atleta designado como técnico.")
    private AthleteDetailsDTO coach;

    @Schema(description = "Data e hora da criação do registo.", accessMode = Schema.AccessMode.READ_ONLY)
    private Instant createdAt;

    @Schema(description = "Data e hora da última atualização do registo.", accessMode = Schema.AccessMode.READ_ONLY)
    private Instant updatedAt;

    public DesignatedCoachDetailsDTO(DesignatedCoach entity) {
        this.id = entity.getId();
        this.competition = new CompetitionSummaryDTO(entity.getCompetition());
        this.sport = new SportSummaryDTO(entity.getSport());
        this.course = new CourseSummaryDTO(entity.getCourse());
        this.coach = new AthleteDetailsDTO(entity.getCoach());
        this.createdAt = entity.getCreatedAt();
        this.updatedAt = entity.getUpdatedAt();
    }
}