package br.edu.ifs.playifs.report;

import br.edu.ifs.playifs.report.dto.*;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.constraints.Positive;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/api/v1/reports")
@Tag(name = "2. Relatórios (BI)", description = "Endpoints para a extração de relatórios e estatísticas complexas sobre as competições.")
@Validated // Ativa a validação para os parâmetros de requisição (@RequestParam)
public class ReportController {

    @Autowired
    private ReportService service;

    @GetMapping(value = "/group-standings")
    @Operation(summary = "Classificação de um Grupo (Público)")
    @ApiResponses({@ApiResponse(responseCode = "200", description = "Relatório gerado."), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError")})
    public ResponseEntity<GroupStandingsReportDTO> getGroupStandings(
            @Parameter(description = "ID do grupo para gerar a classificação.", required = true, example = "1")
            @RequestParam @Positive Long groupId) { // Mensagem genérica (correto)
        GroupStandingsReportDTO dto = service.getGroupStandings(groupId);
        return ResponseEntity.ok(dto);
    }

    @GetMapping(value = "/campaign")
    @Operation(summary = "Campanha de uma Equipa (Público)")
    @ApiResponses({@ApiResponse(responseCode = "200", description = "Relatório gerado."), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError")})
    public ResponseEntity<TeamCampaignDTO> getTeamCampaign(
            @Parameter(description = "ID da equipa.", required = true, example = "1") @RequestParam @Positive Long teamId,
            @Parameter(description = "ID da competição.", required = true, example = "1") @RequestParam @Positive Long competitionId) {
        TeamCampaignDTO dto = service.getTeamCampaign(teamId, competitionId);
        return ResponseEntity.ok(dto);
    }

    @GetMapping(value = "/statistics")
    @Operation(summary = "Estatísticas de um Desporto (Público)")
    public ResponseEntity<SportStatisticsDTO> getSportStatistics(
            @Parameter(description = "ID da competição.", required = true, example = "1") @RequestParam @Positive Long competitionId,
            @Parameter(description = "ID do desporto.", required = true, example = "1") @RequestParam @Positive Long sportId) {
        SportStatisticsDTO dto = service.getSportStatistics(competitionId, sportId);
        return ResponseEntity.ok(dto);
    }

    @GetMapping(value = "/top3")
    @Operation(summary = "Pódio de um Desporto (Público)")
    @ApiResponses({@ApiResponse(responseCode = "200", description = "Relatório gerado."), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")})
    public ResponseEntity<Top3ReportDTO> getTop3(
            @Parameter(description = "ID da competição.", required = true, example = "1") @RequestParam @Positive Long competitionId,
            @Parameter(description = "ID do desporto.", required = true, example = "1") @RequestParam @Positive Long sportId) {
        Top3ReportDTO report = service.getTop3Report(competitionId, sportId);
        return ResponseEntity.ok(report);
    }

    @GetMapping(value = "/wo-summary")
    @Operation(summary = "Relatório de W.O.s (Público)")
    public ResponseEntity<WoSummaryReportDTO> getWoSummary(
            @Parameter(description = "ID da competição para gerar o relatório.", required = true, example = "1")
            @RequestParam @Positive Long competitionId) {
        WoSummaryReportDTO dto = service.getWoSummary(competitionId);
        return ResponseEntity.ok(dto);
    }
}