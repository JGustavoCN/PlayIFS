package br.edu.ifs.playifs.controllers;

import br.edu.ifs.playifs.dto.dashboard.AthleteDashboardDTO;
import br.edu.ifs.playifs.dto.dashboard.CoordinatorDashboardDTO; // Importar
import br.edu.ifs.playifs.entities.User;
import br.edu.ifs.playifs.services.DashboardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping
public class DashboardController {

    @Autowired
    private DashboardService service;

    @GetMapping(value = "/dashboard/athlete")
    @PreAuthorize("hasRole('ATHLETE')")
    public ResponseEntity<AthleteDashboardDTO> getAthleteDashboard(@AuthenticationPrincipal UserDetails userDetails) {
        AthleteDashboardDTO dto = service.getAthleteDashboard(userDetails);
        return ResponseEntity.ok(dto);
    }

    @GetMapping(value = "/dashboard/coordinator")
    @PreAuthorize("hasRole('COORDINATOR')")
    public ResponseEntity<CoordinatorDashboardDTO> getCoordinatorDashboard() {
        CoordinatorDashboardDTO dto = service.getCoordinatorDashboard();
        return ResponseEntity.ok(dto);
    }
}