package br.edu.ifs.playifs.game.model.enums;

import io.swagger.v3.oas.annotations.media.Schema;

@Schema(description = "Fase atual do jogo em um torneio ou campeonato")
public enum GamePhase {

    @Schema(description = "Fase de grupos do torneio")
    GROUP_STAGE,

    @Schema(description = "Oitavas de final")
    ROUND_OF_16,

    @Schema(description = "Quartas de final")
    QUARTER_FINALS,

    @Schema(description = "Semifinal")
    SEMI_FINALS,

    @Schema(description = "Final do torneio")
    FINAL,

    @Schema(description = "Disputa pelo terceiro lugar")
    THIRD_PLACE_DISPUTE;
}
