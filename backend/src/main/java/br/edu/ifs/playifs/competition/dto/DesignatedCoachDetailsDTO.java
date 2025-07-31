package br.edu.ifs.playifs.competition.dto;

import br.edu.ifs.playifs.competition.model.DesignatedCoach;
import br.edu.ifs.playifs.data.course.dto.CourseSummaryDTO; // Alterado para SummaryDTO
import br.edu.ifs.playifs.data.sport.dto.SportSummaryDTO; // Alterado para SummaryDTO
import br.edu.ifs.playifs.user.dto.AthleteDetailsDTO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Schema(description = "DTO para representar os dados detalhados de uma designação de técnico.")
public class DesignatedCoachDetailsDTO {

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

    public DesignatedCoachDetailsDTO(DesignatedCoach entity) {
        this.id = entity.getId();
        this.competition = new CompetitionSummaryDTO(entity.getCompetition());
        this.sport = new SportSummaryDTO(entity.getSport());
        this.course = new CourseSummaryDTO(entity.getCourse());
        this.coach = new AthleteDetailsDTO(entity.getCoach());
    }
}