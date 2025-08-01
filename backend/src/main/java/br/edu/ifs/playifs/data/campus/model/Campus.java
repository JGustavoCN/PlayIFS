package br.edu.ifs.playifs.data.campus.model;

import br.edu.ifs.playifs.data.course.model.Course;
import br.edu.ifs.playifs.shared.model.AuditableEntity;
import jakarta.persistence.*;
import lombok.*;

import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "tb_campus")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of = "id", callSuper = true)
@ToString(callSuper = true)
public class Campus extends AuditableEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;

    @OneToMany(mappedBy = "campus")
    private Set<Course> courses = new HashSet<>();
}