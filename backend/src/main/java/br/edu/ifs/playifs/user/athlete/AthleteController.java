package br.edu.ifs.playifs.user.athlete;

import br.edu.ifs.playifs.config.SecurityConstants;
import br.edu.ifs.playifs.security.annotations.IsAuthenticated;
import br.edu.ifs.playifs.security.annotations.IsCoordinator;
import br.edu.ifs.playifs.security.annotations.IsSelfOrCoordinator;
import br.edu.ifs.playifs.user.dto.AthleteDTO;
import br.edu.ifs.playifs.user.dto.AthleteInsertDTO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import io.swagger.v3.oas.annotations.security.SecurityRequirements;
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
@RequestMapping(value = "/athletes")
@Tag(name = "6. Gestão de Perfis - Atletas", description = "Endpoints para o cadastro público e gestão administrativa de perfis de atletas.")
@SecurityRequirement(name = SecurityConstants.SECURITY_SCHEME_NAME)
@Validated
public class AthleteController {

    @Autowired
    private AthleteService service;

    @GetMapping
    @Operation(summary = "Lista todos os atletas de forma paginada")
    @IsAuthenticated
    public ResponseEntity<Page<AthleteDTO>> findAll(
            @Parameter(description = "Texto para buscar no nome do atleta") @RequestParam(value = "name", defaultValue = "") String name,
            Pageable pageable) {
        Page<AthleteDTO> page = service.findAll(name, pageable);
        return ResponseEntity.ok(page);
    }

    @GetMapping(value = "/{id}")
    @Operation(summary = "Busca um atleta por ID")
    @ApiResponses(value = {@ApiResponse(responseCode = "200", description = "Atleta encontrado"), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError")})
    @IsAuthenticated
    public ResponseEntity<AthleteDTO> findById(@PathVariable @Positive Long id) {
        AthleteDTO dto = service.findById(id);
        return ResponseEntity.ok(dto);
    }

    @PostMapping
    @Operation(summary = "Cadastra um novo atleta (Público)")
    @SecurityRequirements({})
    @ApiResponses(value = {@ApiResponse(responseCode = "201", description = "Atleta cadastrado"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")})
    public ResponseEntity<AthleteDTO> insert(@Valid @RequestBody AthleteInsertDTO dto) {
        AthleteDTO newDto = service.insert(dto);
        URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(newDto.getId()).toUri();
        return ResponseEntity.created(uri).body(newDto);
    }

    @PutMapping(value = "/{id}")
    @Operation(summary = "Atualiza os dados de um atleta (Apenas o próprio Atleta ou Coordenador)")
    @ApiResponses(value = {@ApiResponse(responseCode = "200", description = "Atleta atualizado"), @ApiResponse(responseCode = "403", ref = "#/components/responses/ForbiddenError"), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")})
    @IsSelfOrCoordinator
    public ResponseEntity<AthleteDTO> update(@PathVariable @Positive Long id, @Valid @RequestBody AthleteDTO dto) {
        dto = service.update(id, dto);
        return ResponseEntity.ok(dto);
    }

    @DeleteMapping(value = "/{id}")
    @Operation(summary = "Apaga um atleta (Apenas Coordenador)")
    @ApiResponses(value = {@ApiResponse(responseCode = "204", description = "Atleta apagado"), @ApiResponse(responseCode = "403", ref = "#/components/responses/ForbiddenError"), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")})
    @IsCoordinator
    public ResponseEntity<Void> delete(@PathVariable @Positive Long id) {
        service.delete(id);
        return ResponseEntity.noContent().build();
    }
}