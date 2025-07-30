package br.edu.ifs.playifs.team.model;

import br.edu.ifs.playifs.competition.model.Competition;
import br.edu.ifs.playifs.competition.model.GameGroup;
import br.edu.ifs.playifs.data.course.model.Course;
import br.edu.ifs.playifs.game.model.Game;
import br.edu.ifs.playifs.data.sport.model.Sport;
import br.edu.ifs.playifs.user.model.Athlete;
import jakarta.persistence.*;
import lombok.*;

import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "tb_team")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of = "id") // Usando a forma correta e mais simples
@ToString
public class Team {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;

    @ManyToOne
    @JoinColumn(name = "course_id")
    private Course course;

    @ManyToOne
    @JoinColumn(name = "sport_id")
    private Sport sport;

    @ManyToOne
    @JoinColumn(name = "coach_id")
    private Athlete coach;

    @ManyToMany
    @JoinTable(name = "tb_team_athlete",
            joinColumns = @JoinColumn(name = "team_id"),
            inverseJoinColumns = @JoinColumn(name = "athlete_id"))
    private Set<Athlete> athletes = new HashSet<>();

    @ManyToOne
    @JoinColumn(name = "competition_id")
    private Competition competition;

    @ManyToOne
    @JoinColumn(name = "game_group_id")
    private GameGroup gameGroup;

    @OneToMany(mappedBy = "teamA")
    private Set<Game> gamesAsTeamA = new HashSet<>();

    @OneToMany(mappedBy = "teamB")
    private Set<Game> gamesAsTeamB = new HashSet<>();
}