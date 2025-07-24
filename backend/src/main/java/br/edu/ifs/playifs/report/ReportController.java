package br.edu.ifs.playifs.report;

import br.edu.ifs.playifs.config.SecurityConstants;
import br.edu.ifs.playifs.report.dto.*;
import br.edu.ifs.playifs.security.annotations.IsAuthenticated;
import br.edu.ifs.playifs.security.annotations.IsCoordinator;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/reports")
@Tag(name = "2. Relatórios (BI)", description = "Endpoints para a extração de relatórios e estatísticas complexas sobre as competições.")
public class ReportController {

    @Autowired
    private ReportService service;

    @GetMapping(value = "/wo-summary")
    @Operation(summary = "Relatório de W.O.s (Público)", description = "Retorna um resumo de todos os jogos que terminaram em W.O. em uma competição.")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Relatório gerado com sucesso."),
            @ApiResponse(responseCode = "401", ref = "#/components/responses/UnauthorizedError"),
            @ApiResponse(responseCode = "403", ref = "#/components/responses/ForbiddenError")
    })
    public ResponseEntity<WoSummaryReportDTO> getWoSummary(
            @Parameter(description = "ID da competição para gerar o relatório.", required = true, example = "1")
            @RequestParam(name = "competitionId") Long competitionId) {
        WoSummaryReportDTO dto = service.getWoSummary(competitionId);
        return ResponseEntity.ok(dto);
    }

    @GetMapping(value = "/statistics")
    @Operation(summary = "Estatísticas de um Desporto (Público)", description = "Retorna estatísticas agregadas (total de jogos, gols, média, etc.) de um desporto específico em uma competição.")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Relatório gerado com sucesso.")
    })
    public ResponseEntity<SportStatisticsDTO> getSportStatistics(
            @Parameter(description = "ID da competição.", required = true, example = "1") @RequestParam(name = "competitionId") Long competitionId,
            @Parameter(description = "ID do desporto.", required = true, example = "1") @RequestParam(name = "sportId") Long sportId) {
        SportStatisticsDTO dto = service.getSportStatistics(competitionId, sportId);
        return ResponseEntity.ok(dto);
    }

    @GetMapping(value = "/campaign")
    @Operation(summary = "Campanha de uma Equipa (Público)", description = "Retorna um relatório detalhado sobre a campanha de uma equipa específica em uma competição.")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Relatório gerado com sucesso."),
            @ApiResponse(responseCode = "401", ref = "#/components/responses/UnauthorizedError"),
            @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError")
    })
    public ResponseEntity<TeamCampaignDTO> getTeamCampaign(
            @Parameter(description = "ID da equipa.", required = true, example = "1") @RequestParam(name = "teamId") Long teamId,
            @Parameter(description = "ID da competição.", required = true, example = "1") @RequestParam(name = "competitionId") Long competitionId) {
        TeamCampaignDTO dto = service.getTeamCampaign(teamId, competitionId);
        return ResponseEntity.ok(dto);
    }

    @GetMapping(value = "/group-standings")
    @Operation(summary = "Classificação de um Grupo (Público)", description = "Retorna a tabela de classificação completa e ordenada de um grupo específico da fase de grupos.")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Relatório gerado com sucesso."),
            @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError")
    })
    public ResponseEntity<GroupStandingsReportDTO> getGroupStandings(
            @Parameter(description = "ID do grupo para gerar a classificação.", required = true, example = "1")
            @RequestParam(name = "groupId") Long groupId) {
        GroupStandingsReportDTO dto = service.getGroupStandings(groupId);
        return ResponseEntity.ok(dto);
    }

    @GetMapping(value = "/top3")
    @Operation(summary = "Pódio de um Desporto (Público)", description = "Retorna o pódio (1º, 2º e 3º lugares) de um desporto específico em uma competição, após a final ter sido concluída.")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Relatório gerado com sucesso."),
            @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError"),
            @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")
    })
    public ResponseEntity<Top3ReportDTO> getTop3(
            @Parameter(description = "ID da competição.", required = true, example = "1") @RequestParam(name = "competitionId") Long competitionId,
            @Parameter(description = "ID do desporto.", required = true, example = "1") @RequestParam(name = "sportId") Long sportId) {
        Top3ReportDTO report = service.getTop3Report(competitionId, sportId);
        return ResponseEntity.ok(report);
    }
}