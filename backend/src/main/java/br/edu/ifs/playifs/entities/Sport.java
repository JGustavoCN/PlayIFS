package br.edu.ifs.playifs.entities;

import jakarta.persistence.*;
import lombok.*;

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
}
