package br.edu.ifs.playifs.user.athlete;

import br.edu.ifs.playifs.config.SecurityConstants;
import br.edu.ifs.playifs.security.annotations.IsAuthenticated;
import br.edu.ifs.playifs.security.annotations.IsCoordinator;
import br.edu.ifs.playifs.security.annotations.IsSelfOrCoordinator;
import br.edu.ifs.playifs.shared.web.dto.PageDTO;
import br.edu.ifs.playifs.user.dto.AthleteDetailsDTO; // Importação alterada
import br.edu.ifs.playifs.user.dto.AthleteInputDTO;
import br.edu.ifs.playifs.user.dto.AthleteSummaryDTO;
import br.edu.ifs.playifs.user.dto.AthleteUpdateDTO; // Nova importação
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
    public ResponseEntity<PageDTO<AthleteSummaryDTO>> findAll( // Tipo de retorno alterado
                                                               @Parameter(description = "Texto para buscar no nome do atleta") @RequestParam(value = "name", defaultValue = "") String name,
                                                               Pageable pageable) {
        PageDTO<AthleteSummaryDTO> page = service.findAll(name, pageable); // Tipo do DTO alterado
        return ResponseEntity.ok(page);
    }

    @GetMapping(value = "/{id}")
    @Operation(summary = "Busca um atleta por ID")
    @ApiResponses(value = {@ApiResponse(responseCode = "200", description = "Atleta encontrado"), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError")})
    @IsAuthenticated
    public ResponseEntity<AthleteDetailsDTO> findById(@PathVariable @Positive Long id) { // Tipo de retorno alterado
        AthleteDetailsDTO dto = service.findById(id); // Tipo do DTO alterado
        return ResponseEntity.ok(dto);
    }

    @PostMapping
    @Operation(summary = "Cadastra um novo atleta (Público)")
    @SecurityRequirements({})
    @ApiResponses(value = {@ApiResponse(responseCode = "201", description = "Atleta cadastrado"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")})
    public ResponseEntity<AthleteDetailsDTO> insert(@Valid @RequestBody AthleteInputDTO dto) { // Tipo de retorno alterado
        AthleteDetailsDTO newDto = service.insert(dto); // Tipo do DTO alterado
        URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(newDto.getId()).toUri();
        return ResponseEntity.created(uri).body(newDto);
    }

    @PutMapping(value = "/{id}")
    @Operation(summary = "Atualiza os dados de um atleta (Apenas o próprio Atleta ou Coordenador)")
    @ApiResponses(value = {@ApiResponse(responseCode = "200", description = "Atleta atualizado"), @ApiResponse(responseCode = "403", ref = "#/components/responses/ForbiddenError"), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")})
    @IsSelfOrCoordinator
    public ResponseEntity<AthleteDetailsDTO> update(@PathVariable @Positive Long id, @Valid @RequestBody AthleteUpdateDTO dto) { // Parâmetro e tipo de retorno alterados
        AthleteDetailsDTO updatedDto = service.update(id, dto); // Tipo do DTO alterado
        return ResponseEntity.ok(updatedDto);
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