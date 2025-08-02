package br.edu.ifs.playifs.user.athlete;

import br.edu.ifs.playifs.config.SecurityConstants;
import br.edu.ifs.playifs.security.annotations.IsAuthenticated;
import br.edu.ifs.playifs.security.annotations.IsCoordinator;
import br.edu.ifs.playifs.security.annotations.IsSelfOrCoordinator;
import br.edu.ifs.playifs.shared.web.dto.ApiResponseBody;
import br.edu.ifs.playifs.shared.web.dto.PageDTO;
import br.edu.ifs.playifs.user.dto.*;
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
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;
import java.util.List;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

@RestController
@RequestMapping(value = "/api/v1/athletes")
@Tag(name = "6. Gestão de Perfis - Atletas", description = "Endpoints para o cadastro público e gestão administrativa de perfis de atletas.")
@SecurityRequirement(name = SecurityConstants.SECURITY_SCHEME_NAME)
@Validated
public class AthleteController {

    @Autowired
    private AthleteService service;

    @GetMapping
    @Operation(summary = "Lista todos os atletas de forma paginada")
    @IsAuthenticated
    public ResponseEntity<ApiResponseBody<PageDTO<AthleteSummaryDTO>>> findAll(
            @Parameter(description = "Texto para buscar no nome do atleta") @RequestParam(value = "name", defaultValue = "") String name,
            Pageable pageable) {
        PageDTO<AthleteSummaryDTO> page = service.findAll(name, pageable);
        page.getContent().forEach(athlete ->
                athlete.add(linkTo(methodOn(AthleteController.class).findById(athlete.getId())).withSelfRel())
        );
        return ResponseEntity.ok(new ApiResponseBody<>(page));
    }

    @GetMapping(value = "/{id}")
    @Operation(summary = "Busca um atleta por ID")
    @ApiResponses(value = {@ApiResponse(responseCode = "200", description = "Atleta encontrado"), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError")})
    @IsAuthenticated
    public ResponseEntity<ApiResponseBody<AthleteDetailsDTO>> findById(@PathVariable @Positive Long id) {
        AthleteDetailsDTO dto = service.findById(id);
        addLinksToAthleteDetails(dto);
        return ResponseEntity.ok(new ApiResponseBody<>(dto));
    }

    @PostMapping
    @Operation(summary = "Cadastra um novo atleta (Público)")
    @SecurityRequirements({})
    @ApiResponses(value = {@ApiResponse(responseCode = "201", description = "Atleta cadastrado"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")})
    public ResponseEntity<ApiResponseBody<AthleteDetailsDTO>> insert(@Valid @RequestBody AthleteInputDTO dto) {
        AthleteDetailsDTO newDto = service.insert(dto);
        addLinksToAthleteDetails(newDto);
        URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(newDto.getId()).toUri();
        return ResponseEntity.created(uri).body(new ApiResponseBody<>(newDto, "Atleta cadastrado com sucesso!"));
    }

    @PostMapping("/batch-create")
    @Operation(summary = "Cadastra novos atletas em massa (Coordenador)")
    @ApiResponses({
            @ApiResponse(responseCode = "201", description = "Atletas cadastrados com sucesso"),
            @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")
    })
    @IsCoordinator
    public ResponseEntity<ApiResponseBody<List<AthleteDetailsDTO>>> batchInsert(@Valid @RequestBody AthleteInputBatchDTO batchDto) {
        List<AthleteDetailsDTO> newDtos = service.batchInsert(batchDto.getAthletes());

        // Adiciona links HATEOAS a cada atleta criado
        newDtos.forEach(this::addLinksToAthleteDetails);

        return ResponseEntity.status(HttpStatus.CREATED).body(new ApiResponseBody<>(newDtos, newDtos.size() + " atletas cadastrados com sucesso!"));
    }

    @PutMapping(value = "/{id}")
    @Operation(summary = "Atualiza os dados de um atleta (Apenas o próprio Atleta ou Coordenador)")
    @ApiResponses(value = {@ApiResponse(responseCode = "200", description = "Atleta atualizado"), @ApiResponse(responseCode = "403", ref = "#/components/responses/ForbiddenError"), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")})
    @IsSelfOrCoordinator
    public ResponseEntity<ApiResponseBody<AthleteDetailsDTO>> update(@PathVariable @Positive Long id, @Valid @RequestBody AthleteUpdateDTO dto) {
        AthleteDetailsDTO updatedDto = service.update(id, dto);
        addLinksToAthleteDetails(updatedDto);
        return ResponseEntity.ok(new ApiResponseBody<>(updatedDto, "Atleta atualizado com sucesso!"));
    }

    @DeleteMapping(value = "/{id}")
    @Operation(summary = "Apaga um atleta (Apenas Coordenador)")
    @ApiResponses(value = {@ApiResponse(responseCode = "204", description = "Atleta apagado"), @ApiResponse(responseCode = "403", ref = "#/components/responses/ForbiddenError"), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")})
    @IsCoordinator
    public ResponseEntity<Void> delete(@PathVariable @Positive Long id) {
        service.delete(id);
        return ResponseEntity.noContent().build();
    }

    @PostMapping("/batch-delete")
    @Operation(summary = "Apaga atletas em massa (Coordenador)")
    @ApiResponses({
            @ApiResponse(responseCode = "204", description = "Atletas apagados com sucesso"),
            @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")
    })
    @IsCoordinator
    public ResponseEntity<Void> batchDelete(@Valid @RequestBody br.edu.ifs.playifs.shared.web.dto.IdBatchDTO batchDto) {
        service.batchDelete(batchDto.getIds());
        return ResponseEntity.noContent().build();
    }

    // Método auxiliar para evitar repetição de código
    private void addLinksToAthleteDetails(AthleteDetailsDTO dto) {
        dto.add(linkTo(methodOn(AthleteController.class).findById(dto.getId())).withSelfRel());
        dto.add(linkTo(methodOn(AthleteController.class).findAll(null, Pageable.unpaged())).withRel("athletes"));
    }
}