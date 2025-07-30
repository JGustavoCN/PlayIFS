package br.edu.ifs.playifs.competition.model;

import br.edu.ifs.playifs.team.model.Team;
import br.edu.ifs.playifs.data.course.model.enums.CourseLevel;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "tb_competition")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Competition {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;

    @Enumerated(EnumType.STRING)
    private CourseLevel level; // P/ separa por INTEGRADO, TECNICO, SUPERIOR

    @OneToMany(mappedBy = "competition")
    private Set<Team> teams = new HashSet<>();
}
