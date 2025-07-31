package br.edu.ifs.playifs.competition;

import br.edu.ifs.playifs.competition.dto.CompetitionDetailsDTO;
import br.edu.ifs.playifs.competition.dto.CompetitionInputDTO;
import br.edu.ifs.playifs.competition.dto.CompetitionSummaryDTO;
import br.edu.ifs.playifs.config.SecurityConstants;
import br.edu.ifs.playifs.game.dto.GameDetailsDTO;
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
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;
import java.util.List;

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
    public ResponseEntity<PageDTO<CompetitionSummaryDTO>> findAll(
            @Parameter(description = "Texto para buscar no nome da competição") @RequestParam(defaultValue = "") String name,
            Pageable pageable) {
        PageDTO<CompetitionSummaryDTO> page = service.findAll(name, pageable);
        return ResponseEntity.ok(page);
    }

    @GetMapping(value = "/{id}")
    @Operation(summary = "Busca os detalhes de uma competição por ID")
    @ApiResponses(value = { @ApiResponse(responseCode = "200", description = "Competição encontrada"), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError")})
    @IsAuthenticated
    public ResponseEntity<CompetitionDetailsDTO> findById(@PathVariable @Positive Long id) {
        CompetitionDetailsDTO dto = service.findById(id);
        return ResponseEntity.ok(dto);
    }

    @PostMapping
    @Operation(summary = "Cria uma nova competição (Apenas Coordenador)")
    @ApiResponses(value = { @ApiResponse(responseCode = "201", description = "Competição criada com sucesso"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError") })
    @IsCoordinator
    public ResponseEntity<CompetitionDetailsDTO> insert(@Valid @RequestBody CompetitionInputDTO dto) {
        CompetitionDetailsDTO newDto = service.insert(dto);
        URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(newDto.getId()).toUri();
        return ResponseEntity.created(uri).body(newDto);
    }

    @PutMapping(value = "/{id}")
    @Operation(summary = "Atualiza uma competição (Apenas Coordenador)")
    @ApiResponses(value = { @ApiResponse(responseCode = "200", description = "Competição atualizada"), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError") })
    @IsCoordinator
    public ResponseEntity<CompetitionDetailsDTO> update(@PathVariable @Positive Long id, @Valid @RequestBody CompetitionInputDTO dto) {
        CompetitionDetailsDTO updatedDto = service.update(id, dto);
        return ResponseEntity.ok(updatedDto);
    }

    @DeleteMapping(value = "/{id}")
    @Operation(summary = "Apaga uma competição (Apenas Coordenador)")
    @ApiResponses(value = { @ApiResponse(responseCode = "204", description = "Competição apagada"), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError") })
    @IsCoordinator
    public ResponseEntity<Void> delete(@PathVariable @Positive Long id) {
        service.delete(id);
        return ResponseEntity.noContent().build();
    }

    @PostMapping(value = "/{competitionId}/sports/{sportId}/generate-groups")
    @Operation(summary = "Gera a fase de grupos para um desporto (Apenas Coordenador)")
    @ApiResponses(value = { @ApiResponse(responseCode = "200", description = "Jogos da fase de grupos gerados com sucesso"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError") })
    @IsCoordinator
    public ResponseEntity<List<GameDetailsDTO>> generateGroupStage(@PathVariable @Positive Long competitionId, @PathVariable @Positive Long sportId) {
        List<GameDetailsDTO> generatedGames = service.generateGroupStage(competitionId, sportId);
        return ResponseEntity.ok(generatedGames);
    }

    @PostMapping(value = "/{competitionId}/sports/{sportId}/generate-elimination")
    @Operation(summary = "Gera a fase eliminatória para um desporto (Apenas Coordenador)")
    @ApiResponses(value = { @ApiResponse(responseCode = "200", description = "Jogos da fase eliminatória gerados com sucesso"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError") })
    @IsCoordinator
    public ResponseEntity<List<GameDetailsDTO>> generateEliminationStage(@PathVariable @Positive Long competitionId, @PathVariable @Positive Long sportId) {
        List<GameDetailsDTO> eliminationGames = service.generateEliminationStage(competitionId, sportId);
        return ResponseEntity.ok(eliminationGames);
    }
}