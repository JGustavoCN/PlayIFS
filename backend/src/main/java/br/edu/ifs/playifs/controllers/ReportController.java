package br.edu.ifs.playifs.controllers;

import br.edu.ifs.playifs.dto.reports.*;
import br.edu.ifs.playifs.services.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/reports")
public class ReportController {

    @Autowired
    private ReportService service;

    @GetMapping(value = "/wo-summary")
    @PreAuthorize("hasRole('COORDINATOR')") // Protegido para Coordenadores
    public ResponseEntity<WoSummaryReportDTO> getWoSummary(@RequestParam(name = "competitionId") Long competitionId) {
        WoSummaryReportDTO dto = service.getWoSummary(competitionId);
        return ResponseEntity.ok(dto);
    }

    @GetMapping(value = "/statistics")
    public ResponseEntity<SportStatisticsDTO> getSportStatistics(
            @RequestParam(name = "competitionId") Long competitionId,
            @RequestParam(name = "sportId") Long sportId) {

        SportStatisticsDTO dto = service.getSportStatistics(competitionId, sportId);
        return ResponseEntity.ok(dto);
    }

    @GetMapping(value = "/campaign")
    @PreAuthorize("isAuthenticated()") // Apenas para usuários logados
    public ResponseEntity<TeamCampaignDTO> getTeamCampaign(
            @RequestParam(name = "teamId") Long teamId,
            @RequestParam(name = "competitionId") Long competitionId) {

        TeamCampaignDTO dto = service.getTeamCampaign(teamId, competitionId);
        return ResponseEntity.ok(dto);
    }

    @GetMapping(value = "/group-standings")
    public ResponseEntity<GroupStandingsReportDTO> getGroupStandings(@RequestParam(name = "groupId") Long groupId) {
        GroupStandingsReportDTO dto = service.getGroupStandings(groupId);
        return ResponseEntity.ok(dto);
    }

    @GetMapping(value = "/top3")
    public ResponseEntity<Top3ReportDTO> getTop3(
            @RequestParam(name = "competitionId") Long competitionId,
            @RequestParam(name = "sportId") Long sportId) {

        Top3ReportDTO report = service.getTop3Report(competitionId, sportId);
        return ResponseEntity.ok(report);
    }
}