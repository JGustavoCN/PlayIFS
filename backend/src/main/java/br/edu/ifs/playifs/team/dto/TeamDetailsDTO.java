package br.edu.ifs.playifs.team.dto;

import br.edu.ifs.playifs.competition.dto.CompetitionSummaryDTO;
import br.edu.ifs.playifs.data.course.dto.CourseSummaryDTO;
import br.edu.ifs.playifs.data.sport.dto.SportSummaryDTO;
import br.edu.ifs.playifs.team.model.Team;
import br.edu.ifs.playifs.user.dto.AthleteDetailsDTO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.springframework.hateoas.RepresentationModel;

import java.time.Instant;
import java.util.List;
import java.util.stream.Collectors;

@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@Schema(description = "DTO para representar os dados completos de uma equipa, incluindo seu elenco e a competição que disputa.")
public class TeamDetailsDTO extends RepresentationModel<TeamDetailsDTO> {

    @Schema(description = "ID único da equipa.", example = "1")
    private Long id;

    @Schema(description = "Nome da equipa.", example = "Info Futsal PRO")
    private String name;

    @Schema(description = "Curso ao qual a equipa pertence.")
    private CourseSummaryDTO course;

    @Schema(description = "Desporto que a equipa disputa.")
    private SportSummaryDTO sport;

    @Schema(description = "Competição na qual a equipa está inscrita.")
    private CompetitionSummaryDTO competition;

    @Schema(description = "Atleta que atua como técnico da equipa.")
    private AthleteDetailsDTO coach;

    @Schema(description = "Lista de atletas que compõem o elenco da equipa.")
    private List<AthleteDetailsDTO> athletes;

    @Schema(description = "Data e hora da criação do registo.", accessMode = Schema.AccessMode.READ_ONLY)
    private Instant createdAt;

    @Schema(description = "Data e hora da última atualização do registo.", accessMode = Schema.AccessMode.READ_ONLY)
    private Instant updatedAt;

    public TeamDetailsDTO(Team entity) {
        this.id = entity.getId();
        this.name = entity.getName();
        this.course = new CourseSummaryDTO(entity.getCourse());
        this.sport = new SportSummaryDTO(entity.getSport());
        this.competition = new CompetitionSummaryDTO(entity.getCompetition());
        this.coach = new AthleteDetailsDTO(entity.getCoach());
        this.athletes = entity.getAthletes().stream().map(AthleteDetailsDTO::new).collect(Collectors.toList());
        this.createdAt = entity.getCreatedAt();
        this.updatedAt = entity.getUpdatedAt();
    }
}