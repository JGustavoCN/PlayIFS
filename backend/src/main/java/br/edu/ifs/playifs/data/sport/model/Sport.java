package br.edu.ifs.playifs.data.sport.model;

import br.edu.ifs.playifs.team.model.Team;
import jakarta.persistence.*;
import lombok.*;

import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "tb_sport")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Sport {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private Integer minAthletes; // Mapeia o "número mínimo de cada atleta"
    private Integer maxAthletes; // Mapeia o "número máximo de cada atleta"

    @OneToMany(mappedBy = "sport")
    private Set<Team> teams = new HashSet<>();

}
