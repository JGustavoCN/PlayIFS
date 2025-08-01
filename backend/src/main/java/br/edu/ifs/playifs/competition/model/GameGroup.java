package br.edu.ifs.playifs.competition.model;

import br.edu.ifs.playifs.game.model.Game;
import br.edu.ifs.playifs.shared.model.AuditableEntity;
import br.edu.ifs.playifs.team.model.Team;
import jakarta.persistence.*;
import lombok.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "tb_group")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of = "id", callSuper = true)
@ToString(callSuper = true)
public class GameGroup extends AuditableEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;

    @OneToMany(mappedBy = "gameGroup")
    private Set<Team> teams = new HashSet<>();

    @OneToMany(mappedBy = "group")
    private Set<Game> games = new HashSet<>();
}