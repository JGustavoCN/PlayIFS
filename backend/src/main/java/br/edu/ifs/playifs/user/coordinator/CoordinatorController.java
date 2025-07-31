package br.edu.ifs.playifs.user.coordinator;

import br.edu.ifs.playifs.config.SecurityConstants;
import br.edu.ifs.playifs.security.annotations.IsAuthenticated;
import br.edu.ifs.playifs.security.annotations.IsCoordinator;
import br.edu.ifs.playifs.shared.web.dto.PageDTO;
import br.edu.ifs.playifs.user.dto.CoordinatorDetailsDTO; // Importação alterada
import br.edu.ifs.playifs.user.dto.CoordinatorSummaryDTO; // Nova importação
import br.edu.ifs.playifs.user.dto.CoordinatorInputDTO;
import br.edu.ifs.playifs.user.dto.CoordinatorUpdateDTO; // Nova importação
import br.edu.ifs.playifs.user.model.User;
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
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;

@RestController
@RequestMapping(value = "/api/v1/coordinators")
@Tag(name = "6. Gestão de Perfis - Coordenadores", description = "Endpoints para a gestão administrativa de perfis de coordenadores.")
@SecurityRequirement(name = SecurityConstants.SECURITY_SCHEME_NAME)
@Validated
public class CoordinatorController {

    @Autowired
    private CoordinatorService service;

    @GetMapping
    @Operation(summary = "Lista todos os coordenadores")
    @IsAuthenticated
    public ResponseEntity<PageDTO<CoordinatorSummaryDTO>> findAll( // Tipo de retorno alterado
                                                                   @Parameter(description = "Nome do coordenador para filtrar a busca.") @RequestParam(value = "name", defaultValue = "") String name,
                                                                   Pageable pageable) {
        PageDTO<CoordinatorSummaryDTO> page = service.findAll(name, pageable);
        return ResponseEntity.ok(page);
    }

    @GetMapping(value = "/{id}")
    @Operation(summary = "Busca um coordenador por ID")
    @ApiResponses({@ApiResponse(responseCode = "200", description = "Coordenador encontrado"), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError")})
    @IsAuthenticated
    public ResponseEntity<CoordinatorDetailsDTO> findById(@PathVariable @Positive Long id) { // Tipo de retorno alterado
        CoordinatorDetailsDTO dto = service.findById(id);
        return ResponseEntity.ok(dto);
    }

    @PostMapping
    @Operation(summary = "Cria um novo coordenador (Coordenador)")
    @ApiResponses({@ApiResponse(responseCode = "201", description = "Coordenador criado"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")})
    @IsCoordinator
    public ResponseEntity<CoordinatorDetailsDTO> insert(@Valid @RequestBody CoordinatorInputDTO dto) { // Tipo de retorno alterado
        CoordinatorDetailsDTO newDto = service.insert(dto);
        URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(newDto.getId()).toUri();
        return ResponseEntity.created(uri).body(newDto);
    }

    @PutMapping(value = "/{id}")
    @Operation(summary = "Atualiza um coordenador existente (Coordenador)")
    @ApiResponses({@ApiResponse(responseCode = "200", description = "Coordenador atualizado"), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")})
    @IsCoordinator
    public ResponseEntity<CoordinatorDetailsDTO> update(@PathVariable @Positive Long id, @Valid @RequestBody CoordinatorUpdateDTO dto) { // Parâmetro e tipo de retorno alterados
        CoordinatorDetailsDTO updatedDto = service.update(id, dto);
        return ResponseEntity.ok(updatedDto);
    }

    @DeleteMapping(value = "/{id}")
    @Operation(summary = "Apaga um coordenador (Coordenador)")
    @ApiResponses({@ApiResponse(responseCode = "204", description = "Coordenador apagado"), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")})
    @IsCoordinator
    public ResponseEntity<Void> delete(@PathVariable @Positive Long id, @AuthenticationPrincipal User loggedUser) {
        service.delete(id, loggedUser);
        return ResponseEntity.noContent().build();
    }
}