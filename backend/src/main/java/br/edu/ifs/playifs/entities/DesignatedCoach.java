package br.edu.ifs.playifs.entities;

import jakarta.persistence.*;
import lombok.*;

// ADICIONAR ESTA ANOTAÇÃO PARA A RESTRIÇÃO DE UNICIDADE CORRETA
@Table(name = "tb_designated_coach",
        uniqueConstraints = {
                @UniqueConstraint(columnNames = {"competition_id", "sport_id", "course_id"})
        }
)
@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of = "id")
public class DesignatedCoach {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    private Competition competition;

    @ManyToOne
    private Sport sport;

    @ManyToOne
    private Course course;

    @ManyToOne
    private Athlete coach;
}