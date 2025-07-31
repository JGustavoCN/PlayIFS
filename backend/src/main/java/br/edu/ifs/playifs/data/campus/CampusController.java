package br.edu.ifs.playifs.data.campus;

import br.edu.ifs.playifs.config.SecurityConstants;
import br.edu.ifs.playifs.data.campus.dto.CampusDTO;
import br.edu.ifs.playifs.security.annotations.IsAuthenticated;
import br.edu.ifs.playifs.security.annotations.IsCoordinator;
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
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;

@RestController
@RequestMapping(value = "/campuses")
@Tag(name = "7. Administração (Dados Base) - Campi", description = "Endpoints para a gestão de Campi.")
@SecurityRequirement(name = SecurityConstants.SECURITY_SCHEME_NAME)
@Validated // Ativa a validação para @RequestParam e @PathVariable
public class CampusController {

    @Autowired
    private CampusService service;

    @GetMapping
    @Operation(summary = "Lista todos os campi", description = "Retorna uma lista paginada de todos os campi, com filtro opcional por nome. Requer autenticação.")
    @IsAuthenticated
    public ResponseEntity<Page<CampusDTO>> findAll(
            @Parameter(description = "Texto para buscar no nome do campus.")
            @RequestParam(value = "name", defaultValue = "") String name,
            Pageable pageable) {
        Page<CampusDTO> page = service.findAll(name, pageable);
        return ResponseEntity.ok(page);
    }

    @GetMapping(value = "/{id}")
    @Operation(summary = "Busca um campus por ID")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Campus encontrado com sucesso."),
            @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError")
    })
    @IsAuthenticated
    public ResponseEntity<CampusDTO> findById(
            @Parameter(description = "ID do campus a ser buscado.", required = true, example = "1")
            @PathVariable @Positive Long id) {
        CampusDTO dto = service.findById(id);
        return ResponseEntity.ok(dto);
    }

    @PostMapping
    @Operation(summary = "Cria um novo campus (Coordenador)")
    @ApiResponses({
            @ApiResponse(responseCode = "201", description = "Campus criado com sucesso."),
            @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")
    })
    @IsCoordinator
    public ResponseEntity<CampusDTO> insert(@Valid @RequestBody CampusDTO dto) {
        dto = service.insert(dto);
        URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}")
                .buildAndExpand(dto.getId()).toUri();
        return ResponseEntity.created(uri).body(dto);
    }

    @PutMapping(value = "/{id}")
    @Operation(summary = "Atualiza um campus existente (Coordenador)")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Campus atualizado com sucesso."),
            @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError"),
            @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")
    })
    @IsCoordinator
    public ResponseEntity<CampusDTO> update(
            @PathVariable @Positive Long id,
            @Valid @RequestBody CampusDTO dto) {
        dto = service.update(id, dto);
        return ResponseEntity.ok(dto);
    }

    @DeleteMapping(value = "/{id}")
    @Operation(summary = "Apaga um campus (Coordenador)")
    @ApiResponses({
            @ApiResponse(responseCode = "204", description = "Campus apagado com sucesso."),
            @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError"),
            @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")
    })
    @IsCoordinator
    public ResponseEntity<Void> delete(
            @Parameter(description = "ID do campus a ser apagado.", required = true, example = "1")
            @PathVariable @Positive Long id) {
        service.delete(id);
        return ResponseEntity.noContent().build();
    }
}