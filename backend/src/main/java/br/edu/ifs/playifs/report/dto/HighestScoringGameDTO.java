package br.edu.ifs.playifs.report.dto;

import br.edu.ifs.playifs.game.model.Game;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Schema(description = "Detalhes do jogo com o maior placar agregado.")
public class HighestScoringGameDTO {
    @Schema(description = "Nome da Equipa A.", example = "Info Futsal PRO")
    private String teamA;

    @Schema(description = "Nome da Equipa B.", example = "Edificações FC")
    private String teamB;

    @Schema(description = "Placar final do jogo.", example = "12 – 8")
    private String score;

    public HighestScoringGameDTO(Game entity) {
        this.teamA = entity.getTeamA().getName();
        this.teamB = entity.getTeamB().getName();
        this.score = entity.getScoreTeamA() + " – " + entity.getScoreTeamB();
    }
}