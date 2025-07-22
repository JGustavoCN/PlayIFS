package br.edu.ifs.playifs.dto.dashboard;

import lombok.AllArgsConstructor;
import lombok.Data;
import java.util.List;

@Data
@AllArgsConstructor
public class CoordinatorDashboardDTO {
    private DashboardStatsDTO statistics;
    private List<UpcomingGameDTO> nextGames;
}