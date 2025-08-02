package br.edu.ifs.playifs.dashboard;

import br.edu.ifs.playifs.competition.CompetitionController;
import br.edu.ifs.playifs.config.SecurityConstants;
import br.edu.ifs.playifs.dashboard.dto.AthleteDashboardDTO;
import br.edu.ifs.playifs.dashboard.dto.CoordinatorDashboardDTO;
import br.edu.ifs.playifs.game.GameController;
import br.edu.ifs.playifs.security.annotations.IsAthlete;
import br.edu.ifs.playifs.security.annotations.IsCoordinator;
import br.edu.ifs.playifs.shared.web.dto.ApiResponseBody;
import br.edu.ifs.playifs.team.TeamController;
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

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

@RestController
@RequestMapping ("/api/v1/dashboard")
@Tag(name = "1. Dashboards", description = "Endpoints que fornecem dados consolidados e de alto valor para os painéis de Atleta e Coordenador.")
@SecurityRequirement(name = SecurityConstants.SECURITY_SCHEME_NAME)
public class DashboardController {

    @Autowired
    private DashboardService service;

    @GetMapping(value = "/athlete")
    @Operation(summary = "Retorna os dados do dashboard do atleta (Atleta)")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Dados do dashboard retornados com sucesso."),
            @ApiResponse(responseCode = "401", ref = "#/components/responses/UnauthorizedError"),
            @ApiResponse(responseCode = "403", ref = "#/components/responses/ForbiddenError"),
            @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError")
    })
    @IsAthlete
    public ResponseEntity<ApiResponseBody<AthleteDashboardDTO>> getAthleteDashboard(@AuthenticationPrincipal UserDetails userDetails) {
        AthleteDashboardDTO dto = service.getAthleteDashboard(userDetails);

        dto.add(linkTo(methodOn(DashboardController.class).getAthleteDashboard(userDetails)).withSelfRel());
        dto.getParticipations().forEach(comp -> {
            comp.add(linkTo(methodOn(CompetitionController.class).findById(comp.getCompetitionId())).withRel("competition-details"));
            comp.getSports().forEach(sport -> {
                sport.add(linkTo(methodOn(TeamController.class).findById(sport.getTeamId())).withRel("team-details"));
                if (sport.getNextGame() != null) {
                    sport.getNextGame().add(linkTo(methodOn(GameController.class).findById(sport.getNextGame().getGameId())).withRel("game-details"));
                }
            });
        });

        return ResponseEntity.ok(new ApiResponseBody<>(dto));
    }

    @GetMapping(value = "/coordinator")
    @Operation(summary = "Retorna os dados do dashboard do coordenador (Coordenador)")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Dados do dashboard retornados com sucesso."),
            @ApiResponse(responseCode = "401", ref = "#/components/responses/UnauthorizedError"),
            @ApiResponse(responseCode = "403", ref = "#/components/responses/ForbiddenError")
    })
    @IsCoordinator
    public ResponseEntity<ApiResponseBody<CoordinatorDashboardDTO>> getCoordinatorDashboard() {
        CoordinatorDashboardDTO dto = service.getCoordinatorDashboard();

        dto.add(linkTo(methodOn(DashboardController.class).getCoordinatorDashboard()).withSelfRel());
        dto.getNextGames().forEach(game ->
                game.add(linkTo(methodOn(GameController.class).findById(game.getGameId())).withSelfRel())
        );

        return ResponseEntity.ok(new ApiResponseBody<>(dto));
    }
}