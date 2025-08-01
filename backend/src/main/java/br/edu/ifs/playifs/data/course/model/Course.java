package br.edu.ifs.playifs.data.course.model;

import br.edu.ifs.playifs.data.campus.model.Campus;
import br.edu.ifs.playifs.data.course.model.enums.CourseLevel;
import br.edu.ifs.playifs.shared.model.AuditableEntity;
import br.edu.ifs.playifs.team.model.Team;
import jakarta.persistence.*;
import lombok.*;

import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "tb_course")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of = "id", callSuper = true)
@ToString(callSuper = true)
public class Course extends AuditableEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;

    @Enumerated(EnumType.STRING)
    private CourseLevel level;

    @ManyToOne
    @JoinColumn(name = "campus_id")
    private Campus campus;

    @OneToMany(mappedBy = "course")
    private Set<Team> teams = new HashSet<>();
}