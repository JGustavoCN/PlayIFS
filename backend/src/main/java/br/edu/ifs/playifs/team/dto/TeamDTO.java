package br.edu.ifs.playifs.team.dto;

import br.edu.ifs.playifs.competition.dto.CompetitionDTO;
import br.edu.ifs.playifs.data.course.dto.CourseDTO;
import br.edu.ifs.playifs.data.sport.dto.SportDTO;
import br.edu.ifs.playifs.team.model.Team;
import br.edu.ifs.playifs.user.dto.AthleteDTO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.stream.Collectors;

@Data
@NoArgsConstructor
@Schema(description = "DTO para representar os dados completos de uma equipa, incluindo seu elenco e a competição que disputa.")
public class TeamDTO {

    @Schema(description = "ID único da equipa.", example = "1")
    private Long id;

    @Schema(description = "Nome da equipa.", example = "Info Futsal PRO")
    private String name;

    @Schema(description = "Curso ao qual a equipa pertence.")
    private CourseDTO course;

    @Schema(description = "Desporto que a equipa disputa.")
    private SportDTO sport;

    @Schema(description = "Competição na qual a equipa está inscrita.")
    private CompetitionDTO competition;

    @Schema(description = "Atleta que atua como técnico da equipa.")
    private AthleteDTO coach;

    @Schema(description = "Lista de atletas que compõem o elenco da equipa.")
    private List<AthleteDTO> athletes;

    public TeamDTO(Team entity) {
        this.id = entity.getId();
        this.name = entity.getName();
        this.course = new CourseDTO(entity.getCourse());
        this.sport = new SportDTO(entity.getSport());
        this.competition = new CompetitionDTO(entity.getCompetition());
        this.coach = new AthleteDTO(entity.getCoach());
        this.athletes = entity.getAthletes().stream().map(AthleteDTO::new).collect(Collectors.toList());
    }
}