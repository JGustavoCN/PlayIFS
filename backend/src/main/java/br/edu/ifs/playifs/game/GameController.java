package br.edu.ifs.playifs.game;

import br.edu.ifs.playifs.config.SecurityConstants;
import br.edu.ifs.playifs.game.dto.*;
import br.edu.ifs.playifs.game.model.enums.GamePhase;
import br.edu.ifs.playifs.game.model.enums.GameStatus;
import br.edu.ifs.playifs.security.annotations.IsAuthenticated;
import br.edu.ifs.playifs.security.annotations.IsCoordinator;
import br.edu.ifs.playifs.shared.web.dto.ApiResponseBody;
import br.edu.ifs.playifs.shared.web.dto.IdBatchDTO;
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

import java.util.List;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

@RestController
@RequestMapping(value = "/api/v1/games")
@Tag(name = "5. Jogos (Games)", description = "Endpoints para a gestão de jogos individuais, resultados e W.O.s.")
@SecurityRequirement(name = SecurityConstants.SECURITY_SCHEME_NAME)
@Validated
public class GameController {

    @Autowired
    private GameService service;

    @GetMapping
    @Operation(summary = "Lista todos os jogos")
    @IsAuthenticated
    public ResponseEntity<ApiResponseBody<PageDTO<GameSummaryDTO>>> findAll(
            @Parameter(description = "ID da equipa para filtrar os jogos.")
            @RequestParam(required = false) @Positive Long teamId,

            @Parameter(description = "ID da competição para filtrar os jogos.")
            @RequestParam(required = false) @Positive Long competitionId,

            @Parameter(description = "Status do jogo para filtrar (SCHEDULED, FINISHED, WO).")
            @RequestParam(required = false) GameStatus status,

            @Parameter(description = "Fase do jogo para filtrar (GROUP_STAGE, QUARTER_FINALS, etc.).")
            @RequestParam(required = false) GamePhase phase,

            @Parameter(description = "Parâmetros de paginação e ordenação. Ex: ?sort=dateTime,desc&page=0&size=10")
            Pageable pageable) {

        PageDTO<GameSummaryDTO> page = service.findAll(teamId, competitionId, status, phase, pageable);
        page.getContent().forEach(game ->
                game.add(linkTo(methodOn(GameController.class).findById(game.getId())).withSelfRel())
        );
        return ResponseEntity.ok(new ApiResponseBody<>(page));
    }

    @GetMapping(value = "/{id}")
    @Operation(summary = "Busca um jogo por ID")
    @ApiResponses({@ApiResponse(responseCode = "200", description = "Jogo encontrado"), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError")})
    @IsAuthenticated
    public ResponseEntity<ApiResponseBody<GameDetailsDTO>> findById(@PathVariable @Positive Long id) {
        GameDetailsDTO dto = service.findById(id);
        addLinksToGameDetails(dto);
        return ResponseEntity.ok(new ApiResponseBody<>(dto));
    }

    @PutMapping(value = "/{id}")
    @Operation(summary = "Atualiza a data/hora de um jogo (Coordenador)")
    @ApiResponses({@ApiResponse(responseCode = "200", description = "Jogo atualizado"), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")})
    @IsCoordinator
    public ResponseEntity<ApiResponseBody<GameDetailsDTO>> update(@PathVariable @Positive Long id, @Valid @RequestBody GameUpdateDTO dto) {
        GameDetailsDTO newDto = service.update(id, dto);
        addLinksToGameDetails(newDto);
        return ResponseEntity.ok(new ApiResponseBody<>(newDto, "Jogo atualizado com sucesso!"));
    }

    @DeleteMapping(value = "/{id}")
    @Operation(summary = "Apaga um jogo agendado (Coordenador)")
    @ApiResponses({@ApiResponse(responseCode = "204", description = "Jogo apagado"), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")})
    @IsCoordinator
    public ResponseEntity<Void> delete(@PathVariable @Positive Long id) {
        service.delete(id);
        return ResponseEntity.noContent().build();
    }

    @PostMapping("/batch-delete")
    @Operation(summary = "Apaga jogos agendados em massa (Coordenador)")
    @ApiResponses({
            @ApiResponse(responseCode = "204", description = "Jogos apagados com sucesso"),
            @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")
    })
    @IsCoordinator
    public ResponseEntity<Void> batchDelete(@Valid @RequestBody IdBatchDTO batchDto) {
        service.batchDelete(batchDto.getIds());
        return ResponseEntity.noContent().build();
    }

    @PatchMapping("/datetime/batch-update")
    @Operation(summary = "Reagenda múltiplos jogos em massa (Coordenador)")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Jogos reagendados com sucesso."),
            @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")
    })
    @IsCoordinator
    public ResponseEntity<ApiResponseBody<List<GameDetailsDTO>>> batchUpdateDateTime(
            @Valid @RequestBody GameRescheduleBatchDTO batchDto) {

        List<GameDetailsDTO> updatedGames = service.batchUpdateDateTime(batchDto.getSchedules());

        // Adicionar links HATEOAS a cada jogo atualizado
        updatedGames.forEach(this::addLinksToGameDetails);

        return ResponseEntity.ok(new ApiResponseBody<>(updatedGames, updatedGames.size() + " jogos foram reagendados com sucesso!"));
    }

    @PatchMapping(value = "/{id}/result")
    @Operation(summary = "Atualiza o resultado de um jogo (Coordenador)")
    @ApiResponses({@ApiResponse(responseCode = "200", description = "Resultado atualizado"), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")})
    @IsCoordinator
    public ResponseEntity<ApiResponseBody<GameDetailsDTO>> updateResult(@PathVariable @Positive Long id, @Valid @RequestBody GameResultDTO dto) {
        GameDetailsDTO updatedDto = service.updateResult(id, dto);
        addLinksToGameDetails(updatedDto);
        return ResponseEntity.ok(new ApiResponseBody<>(updatedDto, "Resultado atualizado com sucesso!"));
    }

    @PatchMapping("/results/batch-update")
    @Operation(summary = "Atualiza os resultados de múltiplos jogos em massa (Coordenador)")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Resultados atualizados com sucesso."),
            @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")
    })
    @IsCoordinator
    public ResponseEntity<ApiResponseBody<List<GameDetailsDTO>>> batchUpdateResults(
            @Valid @RequestBody GameResultBatchDTO batchDto) {

        List<GameDetailsDTO> updatedGames = service.batchUpdateResults(batchDto.getResults());

        // Adicionar links HATEOAS a cada jogo atualizado
        updatedGames.forEach(this::addLinksToGameDetails);

        return ResponseEntity.ok(new ApiResponseBody<>(updatedGames, updatedGames.size() + " resultados de jogos foram atualizados com sucesso!"));
    }

    @PatchMapping(value = "/{id}/wo")
    @Operation(summary = "Regista um W.O. (Coordenador)")
    @ApiResponses({@ApiResponse(responseCode = "200", description = "W.O. registado"), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")})
    @IsCoordinator
    public ResponseEntity<ApiResponseBody<GameDetailsDTO>> registerWo(@PathVariable @Positive Long id, @Valid @RequestBody GameWoDTO dto) {
        GameDetailsDTO updatedDto = service.registerWo(id, dto);
        addLinksToGameDetails(updatedDto);
        return ResponseEntity.ok(new ApiResponseBody<>(updatedDto, "W.O. registado com sucesso!"));
    }

    @PatchMapping(value = "/{id}/undo-wo")
    @Operation(summary = "Desfaz um W.O. (Coordenador)")
    @ApiResponses({@ApiResponse(responseCode = "200", description = "W.O. desfeito"), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")})
    @IsCoordinator
    public ResponseEntity<ApiResponseBody<GameDetailsDTO>> undoWo(@PathVariable @Positive Long id) {
        GameDetailsDTO updatedDto = service.undoWo(id);
        addLinksToGameDetails(updatedDto);
        return ResponseEntity.ok(new ApiResponseBody<>(updatedDto, "W.O. desfeito com sucesso!"));
    }

    private void addLinksToGameDetails(GameDetailsDTO dto) {
        dto.add(linkTo(methodOn(GameController.class).findById(dto.getId())).withSelfRel());
        dto.add(linkTo(methodOn(GameController.class).findAll(null, null, null, null, Pageable.unpaged())).withRel("games"));

        if (dto.getTeamA() != null) {
            dto.getTeamA().add(linkTo(methodOn(TeamController.class).findById(dto.getTeamA().getId())).withSelfRel());
        }
        if (dto.getTeamB() != null) {
            dto.getTeamB().add(linkTo(methodOn(TeamController.class).findById(dto.getTeamB().getId())).withSelfRel());
        }
    }
}