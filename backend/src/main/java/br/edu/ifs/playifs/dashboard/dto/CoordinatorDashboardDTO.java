package br.edu.ifs.playifs.dashboard.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import java.util.List;

@Data
@AllArgsConstructor
@Schema(description = "DTO que agrega todas as informações para o dashboard do coordenador.")
public class CoordinatorDashboardDTO {
    @Schema(description = "Estatísticas gerais do sistema.")
    private DashboardStatsDTO statistics;

    @Schema(description = "Lista dos próximos 5 jogos agendados.")
    private List<UpcomingGameDTO> nextGames;
}