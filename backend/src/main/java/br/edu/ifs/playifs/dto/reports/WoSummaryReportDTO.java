package br.edu.ifs.playifs.dto.reports;

import lombok.AllArgsConstructor;
import lombok.Data;
import java.util.List;

@Data
@AllArgsConstructor
public class WoSummaryReportDTO {
    private long totalWo;
    private List<WoGameInfoDTO> games;
}