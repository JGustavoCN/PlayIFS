package br.edu.ifs.playifs.competition;

import br.edu.ifs.playifs.config.SecurityConstants;
import br.edu.ifs.playifs.competition.dto.CompetitionDetailsDTO;
import br.edu.ifs.playifs.competition.dto.CompetitionInputDTO;
import br.edu.ifs.playifs.competition.dto.CompetitionSummaryDTO;
import br.edu.ifs.playifs.data.course.model.enums.CourseLevel;
import br.edu.ifs.playifs.game.GameController;
import br.edu.ifs.playifs.game.dto.GameDetailsDTO;
import br.edu.ifs.playifs.security.annotations.IsAuthenticated;
import br.edu.ifs.playifs.security.annotations.IsCoordinator;
import br.edu.ifs.playifs.shared.web.dto.ApiResponseBody;
import br.edu.ifs.playifs.shared.web.dto.PageDTO;
import br.edu.ifs.playifs.team.TeamController;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Positive;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;
import java.util.List;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

@RestController
@RequestMapping(value = "/api/v1/competitions")
@Tag(name = "3. Competições", description = "Endpoints para criar e gerenciar o ciclo de vida das competições e suas fases.")
@SecurityRequirement(name = SecurityConstants.SECURITY_SCHEME_NAME)
@Validated
public class CompetitionController {

    @Autowired
    private CompetitionService service;

    @GetMapping
    @Operation(summary = "Lista todas as competições (versão resumida)")
    @IsAuthenticated
    public ResponseEntity<ApiResponseBody<PageDTO<CompetitionSummaryDTO>>> findAll(
            @Parameter(description = "Texto para buscar no nome da competição")
            @RequestParam(required = false) String name,

            @Parameter(description = "Nível da competição para filtrar (INTEGRADO, TECNICO, SUPERIOR).")
            @RequestParam(required = false) CourseLevel level,

            @Parameter(description = "Parâmetros de paginação e ordenação. Ex: ?sort=createdAt,desc")
            Pageable pageable) {

        PageDTO<CompetitionSummaryDTO> page = service.findAll(name, level, pageable);

        page.getContent().forEach(competition ->
                competition.add(linkTo(methodOn(CompetitionController.class).findById(competition.getId())).withSelfRel())
        );
        return ResponseEntity.ok(new ApiResponseBody<>(page));
    }

    @GetMapping(value = "/{id}")
    @Operation(summary = "Busca os detalhes de uma competição por ID")
    @ApiResponses(value = { @ApiResponse(responseCode = "200", description = "Competição encontrada"), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError")})
    @IsAuthenticated
    public ResponseEntity<ApiResponseBody<CompetitionDetailsDTO>> findById(@PathVariable @Positive Long id) {
        CompetitionDetailsDTO dto = service.findById(id);
        addLinksToCompetitionDetails(dto);
        return ResponseEntity.ok(new ApiResponseBody<>(dto));
    }

    @PostMapping
    @Operation(summary = "Cria uma nova competição (Apenas Coordenador)")
    @ApiResponses(value = { @ApiResponse(responseCode = "201", description = "Competição criada com sucesso"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError") })
    @IsCoordinator
    public ResponseEntity<ApiResponseBody<CompetitionDetailsDTO>> insert(@Valid @RequestBody CompetitionInputDTO dto) {
        CompetitionDetailsDTO newDto = service.insert(dto);
        addLinksToCompetitionDetails(newDto);
        URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(newDto.getId()).toUri();
        return ResponseEntity.created(uri).body(new ApiResponseBody<>(newDto, "Competição criada com sucesso!"));
    }

    @PutMapping(value = "/{id}")
    @Operation(summary = "Atualiza uma competição (Apenas Coordenador)")
    @ApiResponses(value = { @ApiResponse(responseCode = "200", description = "Competição atualizada"), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError") })
    @IsCoordinator
    public ResponseEntity<ApiResponseBody<CompetitionDetailsDTO>> update(@PathVariable @Positive Long id, @Valid @RequestBody CompetitionInputDTO dto) {
        CompetitionDetailsDTO updatedDto = service.update(id, dto);
        addLinksToCompetitionDetails(updatedDto);
        return ResponseEntity.ok(new ApiResponseBody<>(updatedDto, "Competição atualizada com sucesso!"));
    }

    @DeleteMapping(value = "/{id}")
    @Operation(summary = "Apaga uma competição (Apenas Coordenador)")
    @ApiResponses(value = { @ApiResponse(responseCode = "204", description = "Competição apagada"), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError") })
    @IsCoordinator
    public ResponseEntity<Void> delete(@PathVariable @Positive Long id) {
        service.delete(id);
        return ResponseEntity.noContent().build();
    }

    @PostMapping("/batch-delete")
    @Operation(summary = "Apaga competições em massa (Coordenador)")
    @ApiResponses({
            @ApiResponse(responseCode = "204", description = "Competições apagadas com sucesso"),
            @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")
    })
    @IsCoordinator
    public ResponseEntity<Void> batchDelete(@Valid @RequestBody br.edu.ifs.playifs.shared.web.dto.IdBatchDTO batchDto) {
        service.batchDelete(batchDto.getIds());
        return ResponseEntity.noContent().build();
    }

    @PostMapping(value = "/{competitionId}/sports/{sportId}/generate-groups")
    @Operation(summary = "Gera a fase de grupos para um desporto (Apenas Coordenador)")
    @ApiResponses(value = { @ApiResponse(responseCode = "200", description = "Jogos da fase de grupos gerados com sucesso"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError") })
    @IsCoordinator
    public ResponseEntity<ApiResponseBody<List<GameDetailsDTO>>> generateGroupStage(@PathVariable @Positive Long competitionId, @PathVariable @Positive Long sportId) {
        List<GameDetailsDTO> generatedGames = service.generateGroupStage(competitionId, sportId);
        generatedGames.forEach(game ->
                game.add(linkTo(methodOn(GameController.class).findById(game.getId())).withSelfRel())
        );
        return ResponseEntity.ok(new ApiResponseBody<>(generatedGames, "Fase de grupos gerada com sucesso!"));
    }

    @PostMapping(value = "/{competitionId}/sports/{sportId}/generate-elimination")
    @Operation(summary = "Gera a fase eliminatória para um desporto (Apenas Coordenador)")
    @ApiResponses(value = { @ApiResponse(responseCode = "200", description = "Jogos da fase eliminatória gerados com sucesso"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError") })
    @IsCoordinator
    public ResponseEntity<ApiResponseBody<List<GameDetailsDTO>>> generateEliminationStage(@PathVariable @Positive Long competitionId, @PathVariable @Positive Long sportId) {
        List<GameDetailsDTO> eliminationGames = service.generateEliminationStage(competitionId, sportId);
        eliminationGames.forEach(game ->
                game.add(linkTo(methodOn(GameController.class).findById(game.getId())).withSelfRel())
        );
        return ResponseEntity.ok(new ApiResponseBody<>(eliminationGames, "Fase eliminatória gerada com sucesso!"));
    }

    private void addLinksToCompetitionDetails(CompetitionDetailsDTO dto) {
        dto.add(linkTo(methodOn(CompetitionController.class).findById(dto.getId())).withSelfRel());
        dto.add(linkTo(methodOn(CompetitionController.class).findAll(null, null, Pageable.unpaged())).withRel("competitions"));
        dto.add(linkTo(methodOn(TeamController.class).findAll(null, dto.getId(), null, null, Pageable.unpaged())).withRel("teams"));
    }
}