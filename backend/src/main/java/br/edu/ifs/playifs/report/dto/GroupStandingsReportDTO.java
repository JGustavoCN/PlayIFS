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
@Schema(description = "Relatório com a tabela de classificação completa de um grupo da fase de grupos.")
public class GroupStandingsReportDTO extends RepresentationModel<GroupStandingsReportDTO> {
    @Schema(description = "ID do grupo.", example = "1")
    private Long groupId;

    @Schema(description = "Nome do grupo.", example = "Grupo A - JIFS 2025 (Futsal)")
    private String groupName;

    @Schema(description = "Lista de equipas ordenadas pela classificação.")
    private List<TeamStandingDTO> standings;
}