package br.edu.ifs.playifs.report.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import java.util.List;

@Data
@AllArgsConstructor
@Schema(description = "Relatório resumido de todos os jogos que terminaram em W.O. em uma competição.")
public class WoSummaryReportDTO {
    @Schema(description = "Número total de jogos que terminaram em W.O.", example = "3")
    private long totalWo;

    @Schema(description = "Lista com os detalhes de cada jogo que terminou em W.O.")
    private List<WoGameInfoDTO> games;
}