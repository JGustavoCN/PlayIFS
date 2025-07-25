package br.edu.ifs.playifs.data.campus.model;
import br.edu.ifs.playifs.data.course.model.Course;
import jakarta.persistence.*;
import lombok.*;

import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "tb_campus")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Campus {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    @OneToMany(mappedBy = "campus")
    private Set<Course> courses = new HashSet<>();
}
