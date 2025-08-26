package br.edu.ifs.playifs.competition.model;

import br.edu.ifs.playifs.competition.model.enums.CompetitionStatus; // 1. Importar o Enum
import br.edu.ifs.playifs.data.course.model.enums.CourseLevel;
import br.edu.ifs.playifs.data.sport.model.Sport; // 2. Importar a entidade Sport
import br.edu.ifs.playifs.shared.model.AuditableEntity;
import br.edu.ifs.playifs.team.model.Team;
import jakarta.persistence.*;
import lombok.*;

import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "tb_competition")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of = "id", callSuper = true)
@ToString(callSuper = true)
public class Competition extends AuditableEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;

    @Enumerated(EnumType.STRING)
    private CourseLevel level;

    // 3. ADICIONADO: Campo para o status da competição
    @Enumerated(EnumType.STRING)
    private CompetitionStatus status;

    @OneToMany(mappedBy = "competition")
    private Set<Team> teams = new HashSet<>();

    // 4. ADICIONADO: Relação com os desportos da competição
    @ManyToMany
    @JoinTable(
            name = "tb_competition_sport",
            joinColumns = @JoinColumn(name = "competition_id"),
            inverseJoinColumns = @JoinColumn(name = "sport_id")
    )
    private Set<Sport> sports = new HashSet<>();
}