package br.edu.ifs.playifs.game;

import br.edu.ifs.playifs.config.SecurityConstants;
import br.edu.ifs.playifs.game.dto.*;
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
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

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
            @Parameter(description = "ID da equipa para filtrar os jogos.") @RequestParam(required = false) @Positive Long teamId,
            Pageable pageable) {
        PageDTO<GameSummaryDTO> page = service.findAll(teamId, pageable);
        return ResponseEntity.ok(new ApiResponseBody<>(page));
    }

    @GetMapping(value = "/{id}")
    @Operation(summary = "Busca um jogo por ID")
    @ApiResponses({@ApiResponse(responseCode = "200", description = "Jogo encontrado"), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError")})
    @IsAuthenticated
    public ResponseEntity<ApiResponseBody<GameDetailsDTO>> findById(@PathVariable @Positive Long id) {
        GameDetailsDTO dto = service.findById(id);
        return ResponseEntity.ok(new ApiResponseBody<>(dto));
    }

    @PutMapping(value = "/{id}")
    @Operation(summary = "Atualiza a data/hora de um jogo (Coordenador)")
    @ApiResponses({@ApiResponse(responseCode = "200", description = "Jogo atualizado"), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")})
    @IsCoordinator
    public ResponseEntity<ApiResponseBody<GameDetailsDTO>> update(@PathVariable @Positive Long id, @Valid @RequestBody GameUpdateDTO dto) {
        GameDetailsDTO newDto = service.update(id, dto);
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

    @PatchMapping(value = "/{id}/result")
    @Operation(summary = "Atualiza o resultado de um jogo (Coordenador)")
    @ApiResponses({@ApiResponse(responseCode = "200", description = "Resultado atualizado"), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")})
    @IsCoordinator
    public ResponseEntity<ApiResponseBody<GameDetailsDTO>> updateResult(@PathVariable @Positive Long id, @Valid @RequestBody GameResultDTO dto) {
        GameDetailsDTO updatedDto = service.updateResult(id, dto);
        return ResponseEntity.ok(new ApiResponseBody<>(updatedDto, "Resultado atualizado com sucesso!"));
    }

    @PatchMapping(value = "/{id}/wo")
    @Operation(summary = "Regista um W.O. (Coordenador)")
    @ApiResponses({@ApiResponse(responseCode = "200", description = "W.O. registado"), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")})
    @IsCoordinator
    public ResponseEntity<ApiResponseBody<GameDetailsDTO>> registerWo(@PathVariable @Positive Long id, @Valid @RequestBody GameWoDTO dto) {
        GameDetailsDTO updatedDto = service.registerWo(id, dto);
        return ResponseEntity.ok(new ApiResponseBody<>(updatedDto, "W.O. registado com sucesso!"));
    }

    @PatchMapping(value = "/{id}/undo-wo")
    @Operation(summary = "Desfaz um W.O. (Coordenador)")
    @ApiResponses({@ApiResponse(responseCode = "200", description = "W.O. desfeito"), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")})
    @IsCoordinator
    public ResponseEntity<ApiResponseBody<GameDetailsDTO>> undoWo(@PathVariable @Positive Long id) {
        GameDetailsDTO updatedDto = service.undoWo(id);
        return ResponseEntity.ok(new ApiResponseBody<>(updatedDto, "W.O. desfeito com sucesso!"));
    }
}