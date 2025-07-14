package br.edu.ifs.playifs.entities;
import jakarta.persistence.*;
import lombok.*;

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
}
