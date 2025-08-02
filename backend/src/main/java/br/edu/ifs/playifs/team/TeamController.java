package br.edu.ifs.playifs.team;

import br.edu.ifs.playifs.competition.CompetitionController;
import br.edu.ifs.playifs.config.SecurityConstants;
import br.edu.ifs.playifs.data.course.CourseController;
import br.edu.ifs.playifs.data.sport.SportController;
import br.edu.ifs.playifs.security.annotations.*;
import br.edu.ifs.playifs.shared.web.dto.ApiResponseBody;
import br.edu.ifs.playifs.shared.web.dto.IdBatchDTO;
import br.edu.ifs.playifs.shared.web.dto.PageDTO;
import br.edu.ifs.playifs.team.dto.TeamDetailsDTO;
import br.edu.ifs.playifs.team.dto.TeamInputDTO;
import br.edu.ifs.playifs.team.dto.TeamSummaryDTO;
import br.edu.ifs.playifs.team.dto.TeamUpdateDTO;
import br.edu.ifs.playifs.user.athlete.AthleteController;
import br.edu.ifs.playifs.user.model.User;
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
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

@RestController
@RequestMapping(value = "/api/v1/teams")
@Tag(name = "4. Equipas (Teams)", description = "Endpoints para a gestão de equipas e seus elencos de atletas.")
@SecurityRequirement(name = SecurityConstants.SECURITY_SCHEME_NAME)
@Validated
public class TeamController {

    @Autowired
    private TeamService service;

    @GetMapping
    @Operation(summary = "Lista todas as equipas de forma paginada")
    @IsAuthenticated
    public ResponseEntity<ApiResponseBody<PageDTO<TeamSummaryDTO>>> findAll(
            @Parameter(description = "Filtrar por ID da competição") @RequestParam(required = false) @Positive Long competitionId,
            @Parameter(description = "Filtrar por ID do desporto") @RequestParam(required = false) @Positive Long sportId,
            @Parameter(description = "Filtrar por ID do curso") @RequestParam(required = false) @Positive Long courseId,
            Pageable pageable) {
        PageDTO<TeamSummaryDTO> page = service.findAll(competitionId, sportId, courseId, pageable);
        page.getContent().forEach(team ->
                team.add(linkTo(methodOn(TeamController.class).findById(team.getId())).withSelfRel())
        );
        return ResponseEntity.ok(new ApiResponseBody<>(page));
    }

    @GetMapping(value = "/{id}")
    @Operation(summary = "Busca uma equipa por ID")
    @ApiResponses(value = { @ApiResponse(responseCode = "200", description = "Equipa encontrada"), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError") })
    @IsAuthenticated
    public ResponseEntity<ApiResponseBody<TeamDetailsDTO>> findById(@PathVariable @Positive Long id) {
        TeamDetailsDTO dto = service.findById(id);
        addLinksToTeamDetails(dto);
        return ResponseEntity.ok(new ApiResponseBody<>(dto));
    }

    @PostMapping
    @Operation(summary = "Cria uma nova equipa (apenas Atleta-Técnico)")
    @ApiResponses(value = { @ApiResponse(responseCode = "201", description = "Equipa criada com sucesso"), @ApiResponse(responseCode = "403", ref = "#/components/responses/ForbiddenError"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError") })
    @IsAthlete
    public ResponseEntity<ApiResponseBody<TeamDetailsDTO>> insert(@Valid @RequestBody TeamInputDTO dto, @AuthenticationPrincipal User loggedUser) {
        TeamDetailsDTO newDto = service.insert(dto, loggedUser);
        addLinksToTeamDetails(newDto);
        URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(newDto.getId()).toUri();
        return ResponseEntity.created(uri).body(new ApiResponseBody<>(newDto, "Equipa criada com sucesso!"));
    }

    @PutMapping(value = "/{id}")
    @Operation(summary = "Atualiza o nome da equipa (apenas Técnico da Equipa)")
    @ApiResponses(value = { @ApiResponse(responseCode = "200", description = "Equipa atualizada"), @ApiResponse(responseCode = "403", ref = "#/components/responses/ForbiddenError"), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError") })
    @IsTeamCoach
    public ResponseEntity<ApiResponseBody<TeamDetailsDTO>> update(@PathVariable @Positive Long id, @Valid @RequestBody TeamUpdateDTO dto) {
        TeamDetailsDTO newDto = service.update(id, dto);
        addLinksToTeamDetails(newDto);
        return ResponseEntity.ok(new ApiResponseBody<>(newDto, "Equipa atualizada com sucesso!"));
    }

    @PostMapping(value = "/{id}/athletes/batch-add")
    @Operation(summary = "Adiciona múltiplos atletas a uma equipa (apenas Técnico da Equipa)")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Atletas adicionados com sucesso"),
            @ApiResponse(responseCode = "403", ref = "#/components/responses/ForbiddenError"),
            @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")
    })
    @IsTeamCoach
    public ResponseEntity<ApiResponseBody<TeamDetailsDTO>> batchAddAthletes(
            @PathVariable @Positive Long id,
            @Valid @RequestBody IdBatchDTO batchDto) {

        TeamDetailsDTO newDto = service.batchAddAthletes(id, batchDto.getIds());
        addLinksToTeamDetails(newDto);
        return ResponseEntity.ok(new ApiResponseBody<>(newDto, "Atletas adicionados com sucesso!"));
    }

    @DeleteMapping(value = "/{id}/athletes/{athleteId}")
    @Operation(summary = "Remove um atleta de uma equipa (apenas Técnico da Equipa)")
    @ApiResponses(value = { @ApiResponse(responseCode = "204", description = "Atleta removido"), @ApiResponse(responseCode = "403", ref = "#/components/responses/ForbiddenError"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError") })
    @IsTeamCoach
    public ResponseEntity<Void> removeAthlete(@PathVariable @Positive Long id, @PathVariable @Positive Long athleteId) {
        service.removeAthlete(id, athleteId);
        return ResponseEntity.noContent().build();
    }

    @PostMapping(value = "/{id}/athletes/batch-remove")
    @Operation(summary = "Remove múltiplos atletas de uma equipa (apenas Técnico da Equipa)")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "204", description = "Atletas removidos"),
            @ApiResponse(responseCode = "403", ref = "#/components/responses/ForbiddenError"),
            @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")
    })
    @IsTeamCoach
    public ResponseEntity<Void> batchRemoveAthletes(@PathVariable @Positive Long id, @Valid @RequestBody IdBatchDTO batchDto) {
        service.batchRemoveAthletes(id, batchDto.getIds());
        return ResponseEntity.noContent().build();
    }

    @DeleteMapping(value = "/{id}")
    @Operation(summary = "Apaga uma equipa (Técnico ou Coordenador)")
    @ApiResponses(value = { @ApiResponse(responseCode = "204", description = "Equipa apagada"), @ApiResponse(responseCode = "403", ref = "#/components/responses/ForbiddenError"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError") })
    @IsCoordinator
    public ResponseEntity<Void> delete(@PathVariable @Positive Long id) {
        service.delete(id);
        return ResponseEntity.noContent().build();
    }

    @PostMapping("/batch-delete")
    @Operation(summary = "Apaga equipas em massa (Coordenador)")
    @ApiResponses({
            @ApiResponse(responseCode = "204", description = "Equipas apagadas com sucesso"),
            @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")
    })
    @IsCoordinator
    public ResponseEntity<Void> batchDelete(@Valid @RequestBody IdBatchDTO batchDto) {
        service.batchDelete(batchDto.getIds());
        return ResponseEntity.noContent().build();
    }

    // Método auxiliar para evitar repetição de código
    private void addLinksToTeamDetails(TeamDetailsDTO dto) {
        dto.add(linkTo(methodOn(TeamController.class).findById(dto.getId())).withSelfRel());
        dto.add(linkTo(methodOn(TeamController.class).findAll(null, null, null, Pageable.unpaged())).withRel("teams"));
        dto.getCompetition().add(linkTo(methodOn(CompetitionController.class).findById(dto.getCompetition().getId())).withSelfRel());
        dto.getSport().add(linkTo(methodOn(SportController.class).findById(dto.getSport().getId())).withSelfRel());
        dto.getCourse().add(linkTo(methodOn(CourseController.class).findById(dto.getCourse().getId())).withSelfRel());
        dto.getCoach().add(linkTo(methodOn(AthleteController.class).findById(dto.getCoach().getId())).withSelfRel());
        dto.getAthletes().forEach(athlete ->
                athlete.add(linkTo(methodOn(AthleteController.class).findById(athlete.getId())).withSelfRel())
        );
    }
}