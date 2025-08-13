package br.edu.ifs.playifs.game.model.enums;

import io.swagger.v3.oas.annotations.media.Schema;

@Schema(description = "Status de uma partida ou jogo")
public enum GameStatus {

    @Schema(description = "Jogo agendado para uma data futura")
    SCHEDULED,

    @Schema(description = "Jogo finalizado com sucesso")
    FINISHED,

    @Schema(description = "Jogo encerrado por W.O. (Walkover)")
    WO;
}
