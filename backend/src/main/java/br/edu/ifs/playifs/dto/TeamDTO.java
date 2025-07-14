package br.edu.ifs.playifs.dto;

import br.edu.ifs.playifs.entities.Team;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.stream.Collectors;

@Data
@NoArgsConstructor
public class TeamDTO {
    private Long id;
    private String name;
    private CourseDTO course;
    private SportDTO sport;
    private CompetitionDTO competition; // Adicione o DTO para Competition
    private AthleteDTO coach;
    private List<AthleteDTO> athletes;

    public TeamDTO(Team entity) {
        this.id = entity.getId();
        this.name = entity.getName();
        this.course = new CourseDTO(entity.getCourse());
        this.sport = new SportDTO(entity.getSport());
        this.competition = new CompetitionDTO(entity.getCompetition()); // E o construtor aqui
        this.coach = new AthleteDTO(entity.getCoach());
        this.athletes = entity.getAthletes().stream().map(AthleteDTO::new).collect(Collectors.toList());
    }
}
