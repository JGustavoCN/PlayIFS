package br.edu.ifs.playifs.competition;

import br.edu.ifs.playifs.competition.dto.DesignatedCoachDTO;
import br.edu.ifs.playifs.config.SecurityConstants;
import br.edu.ifs.playifs.security.annotations.IsAuthenticated;
import br.edu.ifs.playifs.security.annotations.IsCoordinator;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "/designated-coaches")
@Tag(name = "8. Técnicos Designados (Admin)", description = "Endpoints para a gestão das autorizações de técnicos para competições.")
@SecurityRequirement(name = SecurityConstants.SECURITY_SCHEME_NAME)
public class DesignatedCoachController {

    @Autowired
    private DesignatedCoachService service;

    @GetMapping
    @Operation(summary = "Lista as designações de técnicos", description = "Retorna uma lista paginada de técnicos designados, com filtros. Requer autenticação.")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Lista retornada com sucesso."),
            @ApiResponse(responseCode = "401", ref = "#/components/responses/UnauthorizedError")
    })
    @IsAuthenticated
    public ResponseEntity<Page<DesignatedCoachDTO>> findAll(
            @Parameter(description = "ID da competição para filtrar a busca.") @RequestParam(value = "competitionId", required = false) Long competitionId,
            @Parameter(description = "ID do desporto para filtrar a busca.") @RequestParam(value = "sportId", required = false) Long sportId,
            @Parameter(description = "ID do curso para filtrar a busca.") @RequestParam(value = "courseId", required = false) Long courseId,
            Pageable pageable) {
        Page<DesignatedCoachDTO> page = service.findAll(competitionId, sportId, courseId, pageable);
        return ResponseEntity.ok(page);
    }

    @GetMapping(value = "/{id}")
    @Operation(summary = "Busca uma designação de técnico por ID", description = "Retorna os detalhes de uma designação específica. Requer autenticação.")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Designação encontrada com sucesso."),
            @ApiResponse(responseCode = "401", ref = "#/components/responses/UnauthorizedError"),
            @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError")
    })
    @IsAuthenticated
    public ResponseEntity<DesignatedCoachDTO> findById(
            @Parameter(description = "ID da designação a ser buscada.", required = true, example = "1")
            @PathVariable Long id) {
        DesignatedCoachDTO dto = service.findById(id);
        return ResponseEntity.ok(dto);
    }

    @PostMapping
    @Operation(summary = "Define um novo técnico (Coordenador)", description = "Cria uma nova designação, autorizando um atleta a ser técnico de uma vaga específica.")
    @ApiResponses({
            @ApiResponse(responseCode = "201", description = "Técnico definido com sucesso."),
            @ApiResponse(responseCode = "401", ref = "#/components/responses/UnauthorizedError"),
            @ApiResponse(responseCode = "403", ref = "#/components/responses/ForbiddenError"),
            @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")
    })
    @IsCoordinator
    public ResponseEntity<DesignatedCoachDTO> defineCoach(@RequestBody DesignatedCoachDTO dto) {
        DesignatedCoachDTO newDto = service.defineCoach(dto);
        return ResponseEntity.status(HttpStatus.CREATED).body(newDto);
    }

    @PutMapping
    @Operation(summary = "Atualiza um técnico (Coordenador)", description = "Atualiza uma designação de técnico existente. Esta operação efetivamente apaga a designação antiga e cria uma nova com os dados fornecidos.")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Técnico atualizado com sucesso."),
            @ApiResponse(responseCode = "401", ref = "#/components/responses/UnauthorizedError"),
            @ApiResponse(responseCode = "403", ref = "#/components/responses/ForbiddenError"),
            @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")
    })
    @IsCoordinator
    public ResponseEntity<DesignatedCoachDTO> updateCoach(@RequestBody DesignatedCoachDTO dto) {
        DesignatedCoachDTO updatedDto = service.updateCoach(dto);
        return ResponseEntity.ok(updatedDto);
    }

    @DeleteMapping
    @Operation(summary = "Remove a designação de um técnico (Coordenador)", description = "Remove a autorização de um atleta para ser técnico de uma vaga específica.")
    @ApiResponses({
            @ApiResponse(responseCode = "204", description = "Designação de técnico removida com sucesso."),
            @ApiResponse(responseCode = "401", ref = "#/components/responses/UnauthorizedError"),
            @ApiResponse(responseCode = "403", ref = "#/components/responses/ForbiddenError"),
            @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError")
    })
    @IsCoordinator
    public ResponseEntity<Void> removeCoach(
            @Parameter(description = "ID da competição da qual o técnico será removido.", required = true, example = "1") @RequestParam Long competitionId,
            @Parameter(description = "ID do desporto do qual o técnico será removido.", required = true, example = "1") @RequestParam Long sportId,
            @Parameter(description = "ID do curso do qual o técnico será removido.", required = true, example = "1") @RequestParam Long courseId) {
        service.removeCoach(competitionId, sportId, courseId);
        return ResponseEntity.noContent().build();
    }
}