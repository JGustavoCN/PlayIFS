package br.edu.ifs.playifs.data.campus;

import br.edu.ifs.playifs.config.SecurityConstants;
import br.edu.ifs.playifs.data.campus.dto.CampusDetailsDTO;
import br.edu.ifs.playifs.data.campus.dto.CampusInputDTO;
import br.edu.ifs.playifs.data.campus.dto.CampusSummaryDTO;
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
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

@RestController
@RequestMapping(value = "/api/v1/campuses")
@Tag(name = "7. Administração (Dados Base) - Campi", description = "Endpoints para a gestão de Campi.")
@SecurityRequirement(name = SecurityConstants.SECURITY_SCHEME_NAME)
@Validated
public class CampusController {

    @Autowired
    private CampusService service;

    @GetMapping
    @Operation(summary = "Lista todos os campi (versão resumida)")
    @IsAuthenticated
    public ResponseEntity<ApiResponseBody<PageDTO<CampusSummaryDTO>>> findAll(
            @Parameter(description = "Texto para buscar no nome do campus.")
            @RequestParam(value = "name", defaultValue = "") String name,
            Pageable pageable) {
        PageDTO<CampusSummaryDTO> page = service.findAll(name, pageable);
        page.getContent().forEach(campus ->
                campus.add(linkTo(methodOn(CampusController.class).findById(campus.getId())).withSelfRel())
        );
        return ResponseEntity.ok(new ApiResponseBody<>(page));
    }

    @GetMapping(value = "/{id}")
    @Operation(summary = "Busca os detalhes de um campus por ID")
    @ApiResponses({@ApiResponse(responseCode = "200", description = "Campus encontrado"), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError")})
    @IsAuthenticated
    public ResponseEntity<ApiResponseBody<CampusDetailsDTO>> findById(@PathVariable @Positive Long id) {
        CampusDetailsDTO dto = service.findById(id);
        dto.add(linkTo(methodOn(CampusController.class).findById(id)).withSelfRel());
        dto.add(linkTo(methodOn(CampusController.class).findAll(null, Pageable.unpaged())).withRel("campuses"));
        return ResponseEntity.ok(new ApiResponseBody<>(dto));
    }

    @PostMapping
    @Operation(summary = "Cria um novo campus (Coordenador)")
    @ApiResponses({@ApiResponse(responseCode = "201", description = "Campus criado"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")})
    @IsCoordinator
    public ResponseEntity<ApiResponseBody<CampusDetailsDTO>> insert(@Valid @RequestBody CampusInputDTO dto) {
        CampusDetailsDTO newDto = service.insert(dto);
        newDto.add(linkTo(methodOn(CampusController.class).findById(newDto.getId())).withSelfRel());
        newDto.add(linkTo(methodOn(CampusController.class).findAll(null, Pageable.unpaged())).withRel("campuses"));
        URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(newDto.getId()).toUri();
        return ResponseEntity.created(uri).body(new ApiResponseBody<>(newDto, "Campus criado com sucesso!"));
    }

    @PutMapping(value = "/{id}")
    @Operation(summary = "Atualiza um campus existente (Coordenador)")
    @ApiResponses({@ApiResponse(responseCode = "200", description = "Campus atualizado"), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")})
    @IsCoordinator
    public ResponseEntity<ApiResponseBody<CampusDetailsDTO>> update(@PathVariable @Positive Long id, @Valid @RequestBody CampusInputDTO dto) {
        CampusDetailsDTO updatedDto = service.update(id, dto);
        updatedDto.add(linkTo(methodOn(CampusController.class).findById(id)).withSelfRel());
        updatedDto.add(linkTo(methodOn(CampusController.class).findAll(null, Pageable.unpaged())).withRel("campuses"));
        return ResponseEntity.ok(new ApiResponseBody<>(updatedDto, "Campus atualizado com sucesso!"));
    }

    @DeleteMapping(value = "/{id}")
    @Operation(summary = "Apaga um campus (Coordenador)")
    @ApiResponses({@ApiResponse(responseCode = "204", description = "Campus apagado"), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")})
    @IsCoordinator
    public ResponseEntity<Void> delete(@PathVariable @Positive Long id) {
        service.delete(id);
        return ResponseEntity.noContent().build();
    }
}