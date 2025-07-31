package br.edu.ifs.playifs.data.sport;

import br.edu.ifs.playifs.config.SecurityConstants;
import br.edu.ifs.playifs.data.sport.dto.SportDetailsDTO;
import br.edu.ifs.playifs.data.sport.dto.SportInputDTO;
import br.edu.ifs.playifs.data.sport.dto.SportSummaryDTO;
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

@RestController
@RequestMapping(value = "/sports")
@Tag(name = "7. Administração (Dados Base) - Desportos", description = "Endpoints para a gestão de modalidades desportivas.")
@SecurityRequirement(name = SecurityConstants.SECURITY_SCHEME_NAME)
@Validated
public class SportController {

    @Autowired
    private SportService service;

    @GetMapping
    @Operation(summary = "Lista todos os desportos (versão resumida)")
    @IsAuthenticated
    public ResponseEntity<PageDTO<SportSummaryDTO>> findAll(
            @Parameter(description = "Texto para buscar no nome do desporto") @RequestParam(defaultValue = "") String name,
            Pageable pageable) {
        PageDTO<SportSummaryDTO> page = service.findAll(name, pageable);
        return ResponseEntity.ok(page);
    }

    @GetMapping(value = "/{id}")
    @Operation(summary = "Busca os detalhes de um desporto por ID")
    @ApiResponses(value = { @ApiResponse(responseCode = "200", description = "Desporto encontrado"), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError") })
    @IsAuthenticated
    public ResponseEntity<SportDetailsDTO> findById(@PathVariable @Positive Long id) {
        SportDetailsDTO dto = service.findById(id);
        return ResponseEntity.ok(dto);
    }

    @PostMapping
    @Operation(summary = "Cria um novo desporto")
    @ApiResponses(value = { @ApiResponse(responseCode = "201", description = "Esporte criado com sucesso"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError") })
    @IsCoordinator
    public ResponseEntity<SportDetailsDTO> insert(@Valid @RequestBody SportInputDTO dto) {
        SportDetailsDTO newDto = service.insert(dto);
        URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(newDto.getId()).toUri();
        return ResponseEntity.created(uri).body(newDto);
    }

    @PutMapping(value = "/{id}")
    @Operation(summary = "Atualiza um desporto")
    @ApiResponses(value = { @ApiResponse(responseCode = "200", description = "Desporto atualizado"), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError") })
    @IsCoordinator
    public ResponseEntity<SportDetailsDTO> update(@PathVariable @Positive Long id, @Valid @RequestBody SportInputDTO dto) {
        SportDetailsDTO updatedDto = service.update(id, dto);
        return ResponseEntity.ok(updatedDto);
    }

    @DeleteMapping(value = "/{id}")
    @Operation(summary = "Apaga um desporto")
    @ApiResponses(value = { @ApiResponse(responseCode = "204", description = "Desporto apagado"), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError") })
    @IsCoordinator
    public ResponseEntity<Void> delete(@PathVariable @Positive Long id) {
        service.delete(id);
        return ResponseEntity.noContent().build();
    }
}