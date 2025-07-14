package br.edu.ifs.playifs.entities;

import br.edu.ifs.playifs.entities.enums.GamePhase;
import br.edu.ifs.playifs.entities.enums.GameStatus;
import jakarta.persistence.*;
import lombok.*;
import java.time.Instant;

@Entity
@Table(name = "tb_game")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Game {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(columnDefinition = "TIMESTAMP WITHOUT TIME ZONE")
    private Instant dateTime;

    private Integer scoreTeamA;
    private Integer scoreTeamB;

    @Enumerated(EnumType.STRING)
    private GameStatus status;

    @Enumerated(EnumType.STRING)
    private GamePhase phase;

    @ManyToOne
    @JoinColumn(name = "group_id")
    private GameGroup group;

    @ManyToOne
    @JoinColumn(name = "team_a_id")
    private Team teamA;

    @ManyToOne
    @JoinColumn(name = "team_b_id")
    private Team teamB;

}
