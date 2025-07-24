package br.edu.ifs.playifs.user.coordinator;

import br.edu.ifs.playifs.config.SecurityConstants;
import br.edu.ifs.playifs.security.annotations.IsAuthenticated;
import br.edu.ifs.playifs.security.annotations.IsCoordinator;
import br.edu.ifs.playifs.user.dto.CoordinatorDTO;
import br.edu.ifs.playifs.user.dto.CoordinatorInsertDTO;
import br.edu.ifs.playifs.user.model.User;
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
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;

@RestController
@RequestMapping(value = "/coordinators")
@Tag(name = "6. Gestão de Perfis - Coordenadores", description = "Endpoints para a gestão administrativa de perfis de coordenadores.")
@SecurityRequirement(name = SecurityConstants.SECURITY_SCHEME_NAME)
public class CoordinatorController {

    @Autowired
    private CoordinatorService service;

    @GetMapping(value = "/{id}")
    @Operation(summary = "Busca um coordenador por ID (Coordenador)")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Coordenador encontrado com sucesso."),
            @ApiResponse(responseCode = "401", ref = "#/components/responses/UnauthorizedError"),
            @ApiResponse(responseCode = "403", ref = "#/components/responses/ForbiddenError"),
            @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError")
    })
    @IsAuthenticated
    public ResponseEntity<CoordinatorDTO> findById(
            @Parameter(description = "ID do coordenador a ser buscado.", required = true, example = "1")
            @PathVariable Long id) {
        CoordinatorDTO dto = service.findById(id);
        return ResponseEntity.ok(dto);
    }

    @GetMapping
    @Operation(summary = "Lista todos os coordenadores (Coordenador)", description = "Retorna uma lista paginada de todos os coordenadores, com filtro opcional por nome.")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Lista de coordenadores retornada com sucesso."),
            @ApiResponse(responseCode = "401", ref = "#/components/responses/UnauthorizedError"),
            @ApiResponse(responseCode = "403", ref = "#/components/responses/ForbiddenError")
    })
    @IsAuthenticated
    public ResponseEntity<Page<CoordinatorDTO>> findAll(
            @Parameter(description = "Nome do coordenador para filtrar a busca (busca parcial, case-insensitive).")
            @RequestParam(value = "name", defaultValue = "") String name,
            Pageable pageable) {
        Page<CoordinatorDTO> page = service.findAll(name, pageable);
        return ResponseEntity.ok(page);
    }

    @PostMapping
    @Operation(summary = "Cria um novo coordenador (Coordenador)")
    @ApiResponses({
            @ApiResponse(responseCode = "201", description = "Coordenador criado com sucesso."),
            @ApiResponse(responseCode = "400", ref = "#/components/responses/BadRequestError"),
            @ApiResponse(responseCode = "401", ref = "#/components/responses/UnauthorizedError"),
            @ApiResponse(responseCode = "403", ref = "#/components/responses/ForbiddenError"),
            @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")
    })
    @IsCoordinator
    public ResponseEntity<CoordinatorDTO> insert(@RequestBody CoordinatorInsertDTO dto) {
        CoordinatorDTO newDto = service.insert(dto);
        URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}")
                .buildAndExpand(newDto.getId()).toUri();
        return ResponseEntity.created(uri).body(newDto);
    }

    @PutMapping(value = "/{id}")
    @Operation(summary = "Atualiza um coordenador existente (Coordenador)")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Coordenador atualizado com sucesso."),
            @ApiResponse(responseCode = "400", ref = "#/components/responses/BadRequestError"),
            @ApiResponse(responseCode = "401", ref = "#/components/responses/UnauthorizedError"),
            @ApiResponse(responseCode = "403", ref = "#/components/responses/ForbiddenError"),
            @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError"),
            @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")
    })
    @IsCoordinator
    public ResponseEntity<CoordinatorDTO> update(
            @Parameter(description = "ID do coordenador a ser atualizado.", required = true, example = "1")
            @PathVariable Long id,
            @RequestBody CoordinatorDTO dto) {
        dto = service.update(id, dto);
        return ResponseEntity.ok(dto);
    }

    @DeleteMapping(value = "/{id}")
    @Operation(summary = "Apaga um coordenador (Coordenador)", description = "Apaga um coordenador do sistema. Um coordenador não pode apagar a sua própria conta.")
    @ApiResponses({
            @ApiResponse(responseCode = "204", description = "Coordenador apagado com sucesso."),
            @ApiResponse(responseCode = "401", ref = "#/components/responses/UnauthorizedError"),
            @ApiResponse(responseCode = "403", ref = "#/components/responses/ForbiddenError"),
            @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError"),
            @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")
    })
    @IsCoordinator
    public ResponseEntity<Void> delete(
            @Parameter(description = "ID do coordenador a ser apagado. Não pode ser o ID do usuário logado.", required = true, example = "2")
            @PathVariable Long id,
            @AuthenticationPrincipal User loggedUser) {
        service.delete(id, loggedUser);
        return ResponseEntity.noContent().build();
    }
}