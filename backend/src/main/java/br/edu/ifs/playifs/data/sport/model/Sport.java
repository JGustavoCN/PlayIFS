package br.edu.ifs.playifs.data.sport.model;

import br.edu.ifs.playifs.shared.model.AuditableEntity;
import br.edu.ifs.playifs.team.model.Team;
import jakarta.persistence.*;
import lombok.*;

import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "tb_sport")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of = "id", callSuper = true)
@ToString(callSuper = true)
public class Sport extends AuditableEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private Integer minAthletes;
    private Integer maxAthletes;

    @OneToMany(mappedBy = "sport")
    private Set<Team> teams = new HashSet<>();
}