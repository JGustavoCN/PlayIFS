package br.edu.ifs.playifs.user.coordinator;

import br.edu.ifs.playifs.config.SecurityConstants;
import br.edu.ifs.playifs.security.annotations.IsAuthenticated;
import br.edu.ifs.playifs.security.annotations.IsCoordinator;
import br.edu.ifs.playifs.shared.web.dto.ApiResponseBody;
import br.edu.ifs.playifs.shared.web.dto.PageDTO;
import br.edu.ifs.playifs.user.dto.CoordinatorDetailsDTO;
import br.edu.ifs.playifs.user.dto.CoordinatorInputDTO;
import br.edu.ifs.playifs.user.dto.CoordinatorSummaryDTO;
import br.edu.ifs.playifs.user.dto.CoordinatorUpdateDTO;
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

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

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
    public ResponseEntity<ApiResponseBody<PageDTO<CoordinatorSummaryDTO>>> findAll(
            @Parameter(description = "Nome do coordenador para filtrar a busca.") @RequestParam(value = "name", defaultValue = "") String name,
            Pageable pageable) {
        PageDTO<CoordinatorSummaryDTO> page = service.findAll(name, pageable);
        page.getContent().forEach(coordinator ->
                coordinator.add(linkTo(methodOn(CoordinatorController.class).findById(coordinator.getId())).withSelfRel())
        );
        return ResponseEntity.ok(new ApiResponseBody<>(page));
    }

    @GetMapping(value = "/{id}")
    @Operation(summary = "Busca um coordenador por ID")
    @ApiResponses({@ApiResponse(responseCode = "200", description = "Coordenador encontrado"), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError")})
    @IsAuthenticated
    public ResponseEntity<ApiResponseBody<CoordinatorDetailsDTO>> findById(@PathVariable @Positive Long id) {
        CoordinatorDetailsDTO dto = service.findById(id);
        dto.add(linkTo(methodOn(CoordinatorController.class).findById(id)).withSelfRel());
        dto.add(linkTo(methodOn(CoordinatorController.class).findAll(null, Pageable.unpaged())).withRel("coordinators"));
        return ResponseEntity.ok(new ApiResponseBody<>(dto));
    }

    @PostMapping
    @Operation(summary = "Cria um novo coordenador (Coordenador)")
    @ApiResponses({@ApiResponse(responseCode = "201", description = "Coordenador criado"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")})
    @IsCoordinator
    public ResponseEntity<ApiResponseBody<CoordinatorDetailsDTO>> insert(@Valid @RequestBody CoordinatorInputDTO dto) {
        CoordinatorDetailsDTO newDto = service.insert(dto);
        newDto.add(linkTo(methodOn(CoordinatorController.class).findById(newDto.getId())).withSelfRel());
        newDto.add(linkTo(methodOn(CoordinatorController.class).findAll(null, Pageable.unpaged())).withRel("coordinators"));
        URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(newDto.getId()).toUri();
        return ResponseEntity.created(uri).body(new ApiResponseBody<>(newDto, "Coordenador criado com sucesso!"));
    }

    @PutMapping(value = "/{id}")
    @Operation(summary = "Atualiza um coordenador existente (Coordenador)")
    @ApiResponses({@ApiResponse(responseCode = "200", description = "Coordenador atualizado"), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")})
    @IsCoordinator
    public ResponseEntity<ApiResponseBody<CoordinatorDetailsDTO>> update(@PathVariable @Positive Long id, @Valid @RequestBody CoordinatorUpdateDTO dto) {
        CoordinatorDetailsDTO updatedDto = service.update(id, dto);
        updatedDto.add(linkTo(methodOn(CoordinatorController.class).findById(id)).withSelfRel());
        updatedDto.add(linkTo(methodOn(CoordinatorController.class).findAll(null, Pageable.unpaged())).withRel("coordinators"));
        return ResponseEntity.ok(new ApiResponseBody<>(updatedDto, "Coordenador atualizado com sucesso!"));
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