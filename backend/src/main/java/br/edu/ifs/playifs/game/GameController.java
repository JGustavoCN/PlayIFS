package br.edu.ifs.playifs.game;

import br.edu.ifs.playifs.config.SecurityConstants;
import br.edu.ifs.playifs.game.dto.GameDTO;
import br.edu.ifs.playifs.game.dto.GameResultDTO;
import br.edu.ifs.playifs.game.dto.GameUpdateDTO;
import br.edu.ifs.playifs.game.dto.GameWoDTO;
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
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "/games")
@Tag(name = "5. Jogos (Games)", description = "Endpoints para a gestão de jogos individuais, resultados e W.O.s.")
@SecurityRequirement(name = SecurityConstants.SECURITY_SCHEME_NAME)
public class GameController {

    @Autowired
    private GameService service;

    @GetMapping
    @Operation(summary = "Lista todos os jogos", description = "Retorna uma lista paginada de todos os jogos, com um filtro opcional por ID da equipa. Requer autenticação.")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Lista de jogos retornada com sucesso."),
            @ApiResponse(responseCode = "401", ref = "#/components/responses/UnauthorizedError")
    })
    @IsAuthenticated
    public ResponseEntity<Page<GameDTO>> findAll(
            @Parameter(description = "ID da equipa para filtrar os jogos.")
            @RequestParam(value = "teamId", required = false) Long teamId,
            Pageable pageable) {
        Page<GameDTO> page = service.findAll(teamId, pageable);
        return ResponseEntity.ok(page);
    }

    @GetMapping(value = "/{id}")
    @Operation(summary = "Busca um jogo por ID", description = "Retorna os detalhes de um jogo específico. Requer autenticação.")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Jogo encontrado com sucesso."),
            @ApiResponse(responseCode = "401", ref = "#/components/responses/UnauthorizedError"),
            @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError")
    })
    @IsAuthenticated
    public ResponseEntity<GameDTO> findById(
            @Parameter(description = "ID do jogo a ser buscado.", required = true, example = "1")
            @PathVariable Long id) {
        GameDTO dto = service.findById(id);
        return ResponseEntity.ok(dto);
    }

    @DeleteMapping(value = "/{id}")
    @Operation(summary = "Apaga um jogo (Coordenador)", description = "Apaga um jogo. Isto só é possível se o jogo ainda estiver no status 'AGENDADO'.")
    @ApiResponses({
            @ApiResponse(responseCode = "204", description = "Jogo apagado com sucesso."),
            @ApiResponse(responseCode = "401", ref = "#/components/responses/UnauthorizedError"),
            @ApiResponse(responseCode = "403", ref = "#/components/responses/ForbiddenError"),
            @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError"),
            @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")
    })
    @IsCoordinator
    public ResponseEntity<Void> delete(
            @Parameter(description = "ID do jogo a ser apagado.", required = true, example = "1")
            @PathVariable Long id) {
        service.delete(id);
        return ResponseEntity.noContent().build();
    }

    @PutMapping(value = "/{id}")
    @Operation(summary = "Atualiza a data/hora de um jogo (Coordenador)", description = "Atualiza a data e a hora de um jogo agendado.")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Jogo atualizado com sucesso."),
            @ApiResponse(responseCode = "401", ref = "#/components/responses/UnauthorizedError"),
            @ApiResponse(responseCode = "403", ref = "#/components/responses/ForbiddenError"),
            @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError")
    })
    @IsCoordinator
    public ResponseEntity<GameDTO> update(
            @Parameter(description = "ID do jogo a ser atualizado.", required = true, example = "1")
            @PathVariable Long id,
            @RequestBody GameUpdateDTO dto) {
        GameDTO newDto = service.update(id, dto);
        return ResponseEntity.ok(newDto);
    }

    @PatchMapping(value = "/{id}/result")
    @Operation(summary = "Atualiza o resultado de um jogo (Coordenador)", description = "Define o placar final de um jogo e atualiza o seu status para 'FINALIZADO'.")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Resultado do jogo atualizado com sucesso."),
            @ApiResponse(responseCode = "401", ref = "#/components/responses/UnauthorizedError"),
            @ApiResponse(responseCode = "403", ref = "#/components/responses/ForbiddenError"),
            @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError")
    })
    @IsCoordinator
    public ResponseEntity<GameDTO> updateResult(
            @Parameter(description = "ID do jogo a ser atualizado.", required = true, example = "1")
            @PathVariable Long id,
            @RequestBody GameResultDTO dto) {
        GameDTO updatedDto = service.updateResult(id, dto);
        return ResponseEntity.ok(updatedDto);
    }

    @PatchMapping(value = "/{id}/wo")
    @Operation(summary = "Regista um W.O. (Coordenador)", description = "Regista o resultado de um jogo como Walkover (W.O.) e define a equipa vencedora.")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "W.O. registado com sucesso."),
            @ApiResponse(responseCode = "401", ref = "#/components/responses/UnauthorizedError"),
            @ApiResponse(responseCode = "403", ref = "#/components/responses/ForbiddenError"),
            @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError"),
            @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")
    })
    @IsCoordinator
    public ResponseEntity<GameDTO> registerWo(
            @Parameter(description = "ID do jogo.", required = true, example = "1")
            @PathVariable Long id,
            @RequestBody GameWoDTO dto) {
        GameDTO updatedDto = service.registerWo(id, dto);
        return ResponseEntity.ok(updatedDto);
    }

    @PatchMapping(value = "/{id}/undo-wo")
    @Operation(summary = "Desfaz um W.O. (Coordenador)", description = "Reverte o status de um jogo de 'WO' para 'AGENDADO' e limpa o seu placar.")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "W.O. desfeito com sucesso."),
            @ApiResponse(responseCode = "401", ref = "#/components/responses/UnauthorizedError"),
            @ApiResponse(responseCode = "403", ref = "#/components/responses/ForbiddenError"),
            @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError"),
            @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")
    })
    @IsCoordinator
    public ResponseEntity<GameDTO> undoWo(
            @Parameter(description = "ID do jogo a ser revertido.", required = true, example = "1")
            @PathVariable Long id) {
        GameDTO updatedDto = service.undoWo(id);
        return ResponseEntity.ok(updatedDto);
    }
}