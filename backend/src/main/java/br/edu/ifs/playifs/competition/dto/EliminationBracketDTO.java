package br.edu.ifs.playifs.competition.dto;

import br.edu.ifs.playifs.game.dto.GameDetailsDTO;
import br.edu.ifs.playifs.game.model.enums.GamePhase;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.hateoas.RepresentationModel;

import java.util.List;
import java.util.Map;

@Data
@AllArgsConstructor
@Schema(description = "DTO para a visualização do chaveamento (bracket) da fase eliminatória.")
public class EliminationBracketDTO extends RepresentationModel<EliminationBracketDTO> {

    @Schema(description = "Um mapa onde a chave é a fase (QUARTER_FINALS, SEMI_FINALS, etc.) e o valor é a lista de jogos daquela fase.")
    private Map<GamePhase, List<GameDetailsDTO>> rounds;
}