package br.edu.ifs.playifs.competition;

import br.edu.ifs.playifs.competition.dto.DesignatedCoachDetailsDTO;
import br.edu.ifs.playifs.competition.dto.DesignatedCoachInputBatchDTO;
import br.edu.ifs.playifs.competition.dto.DesignatedCoachInputDTO;
import br.edu.ifs.playifs.competition.dto.DesignatedCoachSummaryDTO;
import br.edu.ifs.playifs.config.SecurityConstants;
import br.edu.ifs.playifs.data.course.CourseController;
import br.edu.ifs.playifs.data.sport.SportController;
import br.edu.ifs.playifs.security.annotations.IsAuthenticated;
import br.edu.ifs.playifs.security.annotations.IsCoordinator;
import br.edu.ifs.playifs.shared.web.dto.ApiResponseBody;
import br.edu.ifs.playifs.shared.web.dto.IdBatchDTO;
import br.edu.ifs.playifs.shared.web.dto.PageDTO;
import br.edu.ifs.playifs.user.athlete.AthleteController;
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

import java.util.List;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

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
        page.getContent().forEach(dto ->
                dto.add(linkTo(methodOn(DesignatedCoachController.class).findById(dto.getId())).withSelfRel())
        );
        return ResponseEntity.ok(new ApiResponseBody<>(page));
    }

    @GetMapping(value = "/{id}")
    @Operation(summary = "Busca os detalhes de uma designação de técnico por ID")
    @ApiResponses({@ApiResponse(responseCode = "200", description = "Designação encontrada."), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError")})
    @IsAuthenticated
    public ResponseEntity<ApiResponseBody<DesignatedCoachDetailsDTO>> findById(@PathVariable @Positive Long id) {
        DesignatedCoachDetailsDTO dto = service.findById(id);
        addLinksToDesignatedCoachDetails(dto);
        return ResponseEntity.ok(new ApiResponseBody<>(dto));
    }

    @PostMapping
    @Operation(summary = "Define um novo técnico (Coordenador)")
    @ApiResponses({@ApiResponse(responseCode = "201", description = "Técnico definido com sucesso."), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")})
    @IsCoordinator
    public ResponseEntity<ApiResponseBody<DesignatedCoachDetailsDTO>> defineCoach(@Valid @RequestBody DesignatedCoachInputDTO dto) {
        DesignatedCoachDetailsDTO newDto = service.defineCoach(dto);
        addLinksToDesignatedCoachDetails(newDto);
        return ResponseEntity.status(HttpStatus.CREATED).body(new ApiResponseBody<>(newDto, "Técnico definido com sucesso!"));
    }

    @PostMapping("/batch-upsert")
    @Operation(summary = "Cria ou atualiza múltiplas designações de técnicos em massa (Coordenador)")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Designações processadas com sucesso"),
            @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")
    })
    @IsCoordinator
    public ResponseEntity<ApiResponseBody<List<DesignatedCoachDetailsDTO>>> batchUpsert(
            @Valid @RequestBody DesignatedCoachInputBatchDTO batchDto) {

        List<DesignatedCoachDetailsDTO> resultDtos = service.batchUpsert(batchDto.getCoaches());

        // Adiciona links HATEOAS a cada item do resultado
        resultDtos.forEach(this::addLinksToDesignatedCoachDetails);

        return ResponseEntity.ok(new ApiResponseBody<>(resultDtos, resultDtos.size() + " designações foram processadas com sucesso!"));
    }

    @PutMapping
    @Operation(summary = "Atualiza/Substitui um técnico (Coordenador)")
    @ApiResponses({@ApiResponse(responseCode = "200", description = "Técnico atualizado com sucesso."), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")})
    @IsCoordinator
    public ResponseEntity<ApiResponseBody<DesignatedCoachDetailsDTO>> updateCoach(@Valid @RequestBody DesignatedCoachInputDTO dto) {
        DesignatedCoachDetailsDTO updatedDto = service.updateCoach(dto);
        addLinksToDesignatedCoachDetails(updatedDto);
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

    @PostMapping("/batch-remove")
    @Operation(summary = "Remove designações de técnicos em massa (Coordenador)")
    @ApiResponses({
            @ApiResponse(responseCode = "204", description = "Designações removidas com sucesso"),
            @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError")
    })
    @IsCoordinator
    public ResponseEntity<Void> batchRemove(@Valid @RequestBody IdBatchDTO batchDto) {
        service.batchRemove(batchDto.getIds());
        return ResponseEntity.noContent().build();
    }

    // Método auxiliar para evitar repetição de código
    private void addLinksToDesignatedCoachDetails(DesignatedCoachDetailsDTO dto) {
        dto.add(linkTo(methodOn(DesignatedCoachController.class).findById(dto.getId())).withSelfRel());
        dto.add(linkTo(methodOn(DesignatedCoachController.class).findAll(null, null, null, Pageable.unpaged())).withRel("designated-coaches"));

        if (dto.getCompetition() != null) {
            dto.getCompetition().add(linkTo(methodOn(CompetitionController.class).findById(dto.getCompetition().getId())).withSelfRel());
        }
        if (dto.getSport() != null) {
            dto.getSport().add(linkTo(methodOn(SportController.class).findById(dto.getSport().getId())).withSelfRel());
        }
        if (dto.getCourse() != null) {
            dto.getCourse().add(linkTo(methodOn(CourseController.class).findById(dto.getCourse().getId())).withSelfRel());
        }
        if (dto.getCoach() != null) {
            dto.getCoach().add(linkTo(methodOn(AthleteController.class).findById(dto.getCoach().getId())).withSelfRel());
        }
    }
}