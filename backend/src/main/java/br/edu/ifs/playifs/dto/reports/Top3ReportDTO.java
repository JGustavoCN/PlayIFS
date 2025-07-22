package br.edu.ifs.playifs.dto.reports;

import lombok.AllArgsConstructor;
import lombok.Data;
import java.util.List;

@Data
@AllArgsConstructor
public class Top3ReportDTO {
    private CompetitionInfo competition;
    private SportInfo sport;
    private List<PodiumItemDTO> podium;

    // Sub-classes para uma resposta mais limpa
    @Data @AllArgsConstructor
    public static class CompetitionInfo {
        private Long id;
        private String name;
    }

    @Data @AllArgsConstructor
    public static class SportInfo {
        private Long id;
        private String name;
    }
}