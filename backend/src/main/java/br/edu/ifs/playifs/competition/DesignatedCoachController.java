package br.edu.ifs.playifs.competition;

import br.edu.ifs.playifs.competition.dto.DesignatedCoachDetailsDTO;
import br.edu.ifs.playifs.competition.dto.DesignatedCoachInputDTO;
import br.edu.ifs.playifs.competition.dto.DesignatedCoachSummaryDTO;
import br.edu.ifs.playifs.config.SecurityConstants;
import br.edu.ifs.playifs.security.annotations.IsAuthenticated;
import br.edu.ifs.playifs.security.annotations.IsCoordinator;
import br.edu.ifs.playifs.shared.web.dto.ApiResponseBody;
import br.edu.ifs.playifs.shared.web.dto.PageDTO;
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
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "/api/v1/designated-coaches")
@Tag(name = "8. Técnicos Designados (Admin)", description = "Endpoints para a gestão das autorizações de técnicos para competições.")
@SecurityRequirement(name = SecurityConstants.SECURITY_SCHEME_NAME)
@Validated
public class DesignatedCoachController {

    @Autowired
    private DesignatedCoachService service;

    @GetMapping
    @Operation(summary = "Lista as designações de técnicos (versão resumida)")
    @IsAuthenticated
    public ResponseEntity<ApiResponseBody<PageDTO<DesignatedCoachSummaryDTO>>> findAll(
            @Parameter(description = "ID da competição para filtrar.") @RequestParam(required = false) @Positive Long competitionId,
            @Parameter(description = "ID do desporto para filtrar.") @RequestParam(required = false) @Positive Long sportId,
            @Parameter(description = "ID do curso para filtrar.") @RequestParam(required = false) @Positive Long courseId,
            Pageable pageable) {
        PageDTO<DesignatedCoachSummaryDTO> page = service.findAll(competitionId, sportId, courseId, pageable);
        return ResponseEntity.ok(new ApiResponseBody<>(page));
    }

    @GetMapping(value = "/{id}")
    @Operation(summary = "Busca os detalhes de uma designação de técnico por ID")
    @ApiResponses({@ApiResponse(responseCode = "200", description = "Designação encontrada."), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError")})
    @IsAuthenticated
    public ResponseEntity<ApiResponseBody<DesignatedCoachDetailsDTO>> findById(@PathVariable @Positive Long id) {
        DesignatedCoachDetailsDTO dto = service.findById(id);
        return ResponseEntity.ok(new ApiResponseBody<>(dto));
    }

    @PostMapping
    @Operation(summary = "Define um novo técnico (Coordenador)")
    @ApiResponses({@ApiResponse(responseCode = "201", description = "Técnico definido com sucesso."), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")})
    @IsCoordinator
    public ResponseEntity<ApiResponseBody<DesignatedCoachDetailsDTO>> defineCoach(@Valid @RequestBody DesignatedCoachInputDTO dto) {
        DesignatedCoachDetailsDTO newDto = service.defineCoach(dto);
        return ResponseEntity.status(HttpStatus.CREATED).body(new ApiResponseBody<>(newDto, "Técnico definido com sucesso!"));
    }

    @PutMapping
    @Operation(summary = "Atualiza/Substitui um técnico (Coordenador)")
    @ApiResponses({@ApiResponse(responseCode = "200", description = "Técnico atualizado com sucesso."), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")})
    @IsCoordinator
    public ResponseEntity<ApiResponseBody<DesignatedCoachDetailsDTO>> updateCoach(@Valid @RequestBody DesignatedCoachInputDTO dto) {
        DesignatedCoachDetailsDTO updatedDto = service.updateCoach(dto);
        return ResponseEntity.ok(new ApiResponseBody<>(updatedDto, "Técnico atualizado com sucesso!"));
    }

    @DeleteMapping
    @Operation(summary = "Remove a designação de um técnico (Coordenador)")
    @ApiResponses({@ApiResponse(responseCode = "204", description = "Designação removida."), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError")})
    @IsCoordinator
    public ResponseEntity<Void> removeCoach(
            @RequestParam @Positive Long competitionId,
            @RequestParam @Positive Long sportId,
            @RequestParam @Positive Long courseId) {
        service.removeCoach(competitionId, sportId, courseId);
        return ResponseEntity.noContent().build();
    }
}