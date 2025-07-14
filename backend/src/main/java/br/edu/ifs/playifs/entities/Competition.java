package br.edu.ifs.playifs.entities;

import br.edu.ifs.playifs.entities.enums.CourseLevel;
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
    private String name; // Ex: "Jogos Internos do Integrado 2025"

    @Enumerated(EnumType.STRING)
    private CourseLevel level; // Para separar por INTEGRADO, TECNICO, SUPERIOR

    @OneToMany(mappedBy = "competition")
    private Set<Team> teams = new HashSet<>();
}
