    package br.edu.ifs.playifs.report;

    import br.edu.ifs.playifs.competition.CompetitionController;
    import br.edu.ifs.playifs.data.sport.SportController;
    import br.edu.ifs.playifs.game.GameController;
    import br.edu.ifs.playifs.report.dto.*;
    import br.edu.ifs.playifs.shared.web.dto.ApiResponseBody;
    import br.edu.ifs.playifs.team.TeamController;
    import io.swagger.v3.oas.annotations.Operation;
    import io.swagger.v3.oas.annotations.Parameter;
    import io.swagger.v3.oas.annotations.responses.ApiResponse;
    import io.swagger.v3.oas.annotations.responses.ApiResponses;
    import io.swagger.v3.oas.annotations.tags.Tag;
    import jakarta.validation.constraints.Positive;
    import org.springframework.beans.factory.annotation.Autowired;
    import org.springframework.data.domain.Pageable;
    import org.springframework.http.ResponseEntity;
    import org.springframework.validation.annotation.Validated;
    import org.springframework.web.bind.annotation.GetMapping;
    import org.springframework.web.bind.annotation.RequestMapping;
    import org.springframework.web.bind.annotation.RequestParam;
    import org.springframework.web.bind.annotation.RestController;

    import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
    import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

    @RestController
    @RequestMapping(value = "/api/v1/reports")
    @Tag(name = "2. Relatórios (BI)", description = "Endpoints para a extração de relatórios e estatísticas complexas sobre as competições.")
    @Validated
    public class ReportController {

        @Autowired
        private ReportService service;

        @GetMapping(value = "/group-standings")
        @Operation(summary = "Classificação de um Grupo (Público)")
        public ResponseEntity<ApiResponseBody<GroupStandingsReportDTO>> getGroupStandings(
                @Parameter(description = "ID do grupo para gerar a classificação.", required = true, example = "1")
                @RequestParam @Positive Long groupId) {
            GroupStandingsReportDTO dto = service.getGroupStandings(groupId);

            dto.add(linkTo(methodOn(ReportController.class).getGroupStandings(groupId)).withSelfRel());
            dto.getStandings().forEach(team ->
                    team.add(linkTo(methodOn(TeamController.class).findById(team.getTeamId())).withRel("team-details"))
            );

            return ResponseEntity.ok(new ApiResponseBody<>(dto));
        }

        @GetMapping(value = "/campaign")
        @Operation(summary = "Campanha de uma Equipa (Público)")
        public ResponseEntity<ApiResponseBody<TeamCampaignDTO>> getTeamCampaign(
                @Parameter(description = "ID da equipa.", required = true, example = "1") @RequestParam @Positive Long teamId,
                @Parameter(description = "ID da competição.", required = true, example = "1") @RequestParam @Positive Long competitionId) {
            TeamCampaignDTO dto = service.getTeamCampaign(teamId, competitionId);

            dto.add(linkTo(methodOn(ReportController.class).getTeamCampaign(teamId, competitionId)).withSelfRel());
            dto.add(linkTo(methodOn(TeamController.class).findById(teamId)).withRel("team-details"));
            dto.add(linkTo(methodOn(CompetitionController.class).findById(competitionId)).withRel("competition-details"));

            return ResponseEntity.ok(new ApiResponseBody<>(dto));
        }

        @GetMapping(value = "/statistics")
        @Operation(summary = "Estatísticas de um Desporto (Público)")
        public ResponseEntity<ApiResponseBody<SportStatisticsDTO>> getSportStatistics(
                @Parameter(description = "ID da competição.", required = true, example = "1") @RequestParam @Positive Long competitionId,
                @Parameter(description = "ID do desporto.", required = true, example = "1") @RequestParam @Positive Long sportId) {
            SportStatisticsDTO dto = service.getSportStatistics(competitionId, sportId);

            dto.add(linkTo(methodOn(ReportController.class).getSportStatistics(competitionId, sportId)).withSelfRel());
            dto.add(linkTo(methodOn(CompetitionController.class).findById(competitionId)).withRel("competition-details"));
            dto.add(linkTo(methodOn(SportController.class).findById(sportId)).withRel("sport-details"));
            if (dto.getHighestScoringGame() != null) {
                dto.getHighestScoringGame().add(linkTo(methodOn(GameController.class).findById(dto.getHighestScoringGame().getGameId())).withRel("game-details"));
            }

            return ResponseEntity.ok(new ApiResponseBody<>(dto));
        }

        @GetMapping(value = "/top3")
        @Operation(summary = "Pódio de um Desporto (Público)")
        public ResponseEntity<ApiResponseBody<Top3ReportDTO>> getTop3(
                @Parameter(description = "ID da competição.", required = true, example = "1") @RequestParam @Positive Long competitionId,
                @Parameter(description = "ID do desporto.", required = true, example = "1") @RequestParam @Positive Long sportId) {
            Top3ReportDTO report = service.getTop3Report(competitionId, sportId);

            report.add(linkTo(methodOn(ReportController.class).getTop3(competitionId, sportId)).withSelfRel());
            report.getPodium().forEach(item ->
                    item.add(linkTo(methodOn(TeamController.class).findById(item.getTeamId())).withRel("team-details"))
            );

            return ResponseEntity.ok(new ApiResponseBody<>(report));
        }

        @GetMapping(value = "/wo-summary")
        @Operation(summary = "Relatório de W.O.s (Público)")
        public ResponseEntity<ApiResponseBody<WoSummaryReportDTO>> getWoSummary(
                @Parameter(description = "ID da competição para gerar o relatório.", required = true, example = "1")
                @RequestParam @Positive Long competitionId) {
            WoSummaryReportDTO dto = service.getWoSummary(competitionId);

            dto.add(linkTo(methodOn(ReportController.class).getWoSummary(competitionId)).withSelfRel());
            dto.getGames().forEach(game ->
                    game.add(linkTo(methodOn(GameController.class).findById(game.getGameId())).withRel("game-details"))
            );

            return ResponseEntity.ok(new ApiResponseBody<>(dto));
        }
    }