package br.edu.ifs.playifs.dashboard;

import br.edu.ifs.playifs.config.SecurityConstants;
import br.edu.ifs.playifs.dashboard.dto.AthleteDashboardDTO;
import br.edu.ifs.playifs.dashboard.dto.CoordinatorDashboardDTO;
import br.edu.ifs.playifs.security.annotations.IsAthlete;
import br.edu.ifs.playifs.security.annotations.IsCoordinator;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping ("/api/v1/dashboard")
@Tag(name = "1. Dashboards", description = "Endpoints que fornecem dados consolidados e de alto valor para os painéis de Atleta e Coordenador.")
@SecurityRequirement(name = SecurityConstants.SECURITY_SCHEME_NAME)
public class DashboardController {

    @Autowired
    private DashboardService service;

    @GetMapping(value = "/athlete")
    @Operation(summary = "Retorna os dados do dashboard do atleta (Atleta)",
            description = "Agrega todas as informações relevantes para o atleta logado, como suas equipas, competições e próximos jogos.")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Dados do dashboard retornados com sucesso."),
            @ApiResponse(responseCode = "401", ref = "#/components/responses/UnauthorizedError"),
            @ApiResponse(responseCode = "403", ref = "#/components/responses/ForbiddenError"),
            @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError")
    })
    @IsAthlete
    public ResponseEntity<AthleteDashboardDTO> getAthleteDashboard(@AuthenticationPrincipal UserDetails userDetails) {
        AthleteDashboardDTO dto = service.getAthleteDashboard(userDetails);
        return ResponseEntity.ok(dto);
    }

    @GetMapping(value = "/coordinator")
    @Operation(summary = "Retorna os dados do dashboard do coordenador (Coordenador)",
            description = "Agrega estatísticas gerais do sistema e uma lista dos próximos jogos para o coordenador logado.")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Dados do dashboard retornados com sucesso."),
            @ApiResponse(responseCode = "401", ref = "#/components/responses/UnauthorizedError"),
            @ApiResponse(responseCode = "403", ref = "#/components/responses/ForbiddenError")
    })
    @IsCoordinator
    public ResponseEntity<CoordinatorDashboardDTO> getCoordinatorDashboard() {
        CoordinatorDashboardDTO dto = service.getCoordinatorDashboard();
        return ResponseEntity.ok(dto);
    }
}