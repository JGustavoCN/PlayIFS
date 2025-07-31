package br.edu.ifs.playifs.team;

import br.edu.ifs.playifs.config.SecurityConstants;
import br.edu.ifs.playifs.security.annotations.*;
import br.edu.ifs.playifs.team.dto.AthleteListDTO;
import br.edu.ifs.playifs.team.dto.TeamDTO;
import br.edu.ifs.playifs.team.dto.TeamInsertDTO;
import br.edu.ifs.playifs.team.dto.TeamUpdateDTO;
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
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;

@RestController
@RequestMapping(value = "/teams")
@Tag(name = "4. Equipas (Teams)", description = "Endpoints para a gestão de equipas e seus elencos de atletas.")
@SecurityRequirement(name = SecurityConstants.SECURITY_SCHEME_NAME)
@Validated // Ativa a validação para @RequestParam e @PathVariable
public class TeamController {

    @Autowired
    private TeamService service;

    @GetMapping
    @Operation(summary = "Lista todas as equipas de forma paginada")
    @IsAuthenticated
    public ResponseEntity<Page<TeamDTO>> findAll(
            @Parameter(description = "Filtrar por ID da competição") @RequestParam(required = false) @Positive Long competitionId,
            @Parameter(description = "Filtrar por ID do desporto") @RequestParam(required = false) @Positive Long sportId,
            @Parameter(description = "Filtrar por ID do curso") @RequestParam(required = false) @Positive Long courseId,
            Pageable pageable) {
        Page<TeamDTO> page = service.findAll(competitionId, sportId, courseId, pageable);
        return ResponseEntity.ok(page);
    }

    @GetMapping(value = "/{id}")
    @Operation(summary = "Busca uma equipa por ID")
    @ApiResponses(value = { @ApiResponse(responseCode = "200", description = "Equipa encontrada"), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError") })
    @IsAuthenticated
    public ResponseEntity<TeamDTO> findById(@PathVariable @Positive Long id) {
        TeamDTO dto = service.findById(id);
        return ResponseEntity.ok(dto);
    }

    @PostMapping
    @Operation(summary = "Cria uma nova equipa (apenas Atleta-Técnico)")
    @ApiResponses(value = { @ApiResponse(responseCode = "201", description = "Equipa criada com sucesso"), @ApiResponse(responseCode = "403", ref = "#/components/responses/ForbiddenError"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError") })
    @IsAthlete
    public ResponseEntity<TeamDTO> insert(@Valid @RequestBody TeamInsertDTO dto, @AuthenticationPrincipal User loggedUser) {
        TeamDTO newDto = service.insert(dto, loggedUser);
        URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(newDto.getId()).toUri();
        return ResponseEntity.created(uri).body(newDto);
    }

    @PutMapping(value = "/{id}")
    @Operation(summary = "Atualiza o nome da equipa (apenas Técnico da Equipa)")
    @ApiResponses(value = { @ApiResponse(responseCode = "200", description = "Equipa atualizada"), @ApiResponse(responseCode = "403", ref = "#/components/responses/ForbiddenError"), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError") })
    @IsTeamCoach
    public ResponseEntity<TeamDTO> update(@PathVariable @Positive Long id, @Valid @RequestBody TeamUpdateDTO dto) {
        TeamDTO newDto = service.update(id, dto);
        return ResponseEntity.ok(newDto);
    }

    @PostMapping(value = "/{id}/athletes")
    @Operation(summary = "Adiciona atletas a uma equipa (apenas Técnico da Equipa)")
    @ApiResponses(value = { @ApiResponse(responseCode = "200", description = "Atletas adicionados"), @ApiResponse(responseCode = "403", ref = "#/components/responses/ForbiddenError"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError") })
    @IsTeamCoach
    public ResponseEntity<TeamDTO> addAthletes(@PathVariable @Positive Long id, @Valid @RequestBody AthleteListDTO dto) {
        TeamDTO newDto = service.addAthletes(id, dto.getAthleteIds());
        return ResponseEntity.ok(newDto);
    }

    @DeleteMapping(value = "/{id}/athletes/{athleteId}")
    @Operation(summary = "Remove um atleta de uma equipa (apenas Técnico da Equipa)")
    @ApiResponses(value = { @ApiResponse(responseCode = "204", description = "Atleta removido"), @ApiResponse(responseCode = "403", ref = "#/components/responses/ForbiddenError"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError") })
    @IsTeamCoach
    public ResponseEntity<Void> removeAthlete(@PathVariable @Positive Long id, @PathVariable @Positive Long athleteId) {
        service.removeAthlete(id, athleteId);
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
}