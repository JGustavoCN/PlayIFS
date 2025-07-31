package br.edu.ifs.playifs.competition;

import br.edu.ifs.playifs.competition.dto.DesignatedCoachDTO;
import br.edu.ifs.playifs.config.SecurityConstants;
import br.edu.ifs.playifs.security.annotations.IsAuthenticated;
import br.edu.ifs.playifs.security.annotations.IsCoordinator;
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
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "/designated-coaches")
@Tag(name = "8. Técnicos Designados (Admin)", description = "Endpoints para a gestão das autorizações de técnicos para competições.")
@SecurityRequirement(name = SecurityConstants.SECURITY_SCHEME_NAME)
@Validated
public class DesignatedCoachController {

    @Autowired
    private DesignatedCoachService service;

    @GetMapping
    @Operation(summary = "Lista as designações de técnicos")
    @IsAuthenticated
    public ResponseEntity<PageDTO<DesignatedCoachDTO>> findAll(
            @Parameter(description = "ID da competição para filtrar.") @RequestParam(required = false) @Positive Long competitionId,
            @Parameter(description = "ID do desporto para filtrar.") @RequestParam(required = false) @Positive Long sportId,
            @Parameter(description = "ID do curso para filtrar.") @RequestParam(required = false) @Positive Long courseId,
            Pageable pageable) {
        PageDTO<DesignatedCoachDTO> page = service.findAll(competitionId, sportId, courseId, pageable);
        return ResponseEntity.ok(page);
    }


    @GetMapping(value = "/{id}")
    @Operation(summary = "Busca uma designação de técnico por ID")
    @ApiResponses({@ApiResponse(responseCode = "200", description = "Designação encontrada."), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError")})
    @IsAuthenticated
    public ResponseEntity<DesignatedCoachDTO> findById(@PathVariable @Positive Long id) {
        DesignatedCoachDTO dto = service.findById(id);
        return ResponseEntity.ok(dto);
    }

    @PostMapping
    @Operation(summary = "Define um novo técnico (Coordenador)")
    @ApiResponses({@ApiResponse(responseCode = "201", description = "Técnico definido com sucesso."), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")})
    @IsCoordinator
    public ResponseEntity<DesignatedCoachDTO> defineCoach(@Valid @RequestBody DesignatedCoachDTO dto) {
        DesignatedCoachDTO newDto = service.defineCoach(dto);
        return ResponseEntity.status(HttpStatus.CREATED).body(newDto);
    }

    @PutMapping
    @Operation(summary = "Atualiza/Substitui um técnico (Coordenador)")
    @ApiResponses({@ApiResponse(responseCode = "200", description = "Técnico atualizado com sucesso."), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")})
    @IsCoordinator
    public ResponseEntity<DesignatedCoachDTO> updateCoach(@Valid @RequestBody DesignatedCoachDTO dto) {
        DesignatedCoachDTO updatedDto = service.updateCoach(dto);
        return ResponseEntity.ok(updatedDto);
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