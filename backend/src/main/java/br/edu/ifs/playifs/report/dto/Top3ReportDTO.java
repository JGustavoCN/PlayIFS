package br.edu.ifs.playifs.report.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.hateoas.RepresentationModel;

import java.util.List;

@Data
@AllArgsConstructor
@EqualsAndHashCode(callSuper = false)
@Schema(description = "Relatório com o pódio (Top 3) de um desporto em uma competição.")
public class Top3ReportDTO extends RepresentationModel<Top3ReportDTO> {
    @Schema(description = "Informações da competição.")
    private CompetitionInfo competition;

    @Schema(description = "Informações do desporto.")
    private SportInfo sport;

    @Schema(description = "Lista das equipas no pódio.")
    private List<PodiumItemDTO> podium;

    @Data
    @AllArgsConstructor
    @Schema(description = "Informações básicas da competição.")
    public static class CompetitionInfo {
        @Schema(description = "ID da competição.", example = "1")
        private Long id;
        @Schema(description = "Nome da competição.", example = "JIFS 2025 - Etapa Aracaju")
        private String name;
    }

    @Data
    @AllArgsConstructor
    @Schema(description = "Informações básicas do desporto.")
    public static class SportInfo {
        @Schema(description = "ID do desporto.", example = "1")
        private Long id;
        @Schema(description = "Nome do desporto.", example = "Futsal")
        private String name;
    }
}