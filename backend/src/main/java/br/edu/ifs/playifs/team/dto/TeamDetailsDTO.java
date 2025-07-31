package br.edu.ifs.playifs.team.dto;

import br.edu.ifs.playifs.competition.dto.CompetitionSummaryDTO; // Alterado para SummaryDTO
import br.edu.ifs.playifs.data.course.dto.CourseSummaryDTO; // Alterado para SummaryDTO
import br.edu.ifs.playifs.data.sport.dto.SportSummaryDTO; // Alterado para SummaryDTO
import br.edu.ifs.playifs.team.model.Team;
import br.edu.ifs.playifs.user.dto.AthleteDetailsDTO; // Mantido AthleteDTO, pois serve como resumo nesse contexto
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.stream.Collectors;

@Data
@NoArgsConstructor
@Schema(description = "DTO para representar os dados completos de uma equipa, incluindo seu elenco e a competição que disputa.")
public class TeamDetailsDTO {

    @Schema(description = "ID único da equipa.", example = "1")
    private Long id;

    @Schema(description = "Nome da equipa.", example = "Info Futsal PRO")
    private String name;

    @Schema(description = "Curso ao qual a equipa pertence.")
    private CourseSummaryDTO course;

    @Schema(description = "Desporto que a equipa disputa.")
    private SportSummaryDTO sport; // Alterado para SportSummaryDTO

    @Schema(description = "Competição na qual a equipa está inscrita.")
    private CompetitionSummaryDTO competition;

    @Schema(description = "Atleta que atua como técnico da equipa.")
    private AthleteDetailsDTO coach;

    @Schema(description = "Lista de atletas que compõem o elenco da equipa.")
    private List<AthleteDetailsDTO> athletes;

    public TeamDetailsDTO(Team entity) {
        this.id = entity.getId();
        this.name = entity.getName();
        this.course = new CourseSummaryDTO(entity.getCourse());
        this.sport = new SportSummaryDTO(entity.getSport());
        this.competition = new CompetitionSummaryDTO(entity.getCompetition());
        this.coach = new AthleteDetailsDTO(entity.getCoach());
        this.athletes = entity.getAthletes().stream().map(AthleteDetailsDTO::new).collect(Collectors.toList());
    }
}