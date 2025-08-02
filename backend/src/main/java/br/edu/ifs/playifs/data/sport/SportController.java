package br.edu.ifs.playifs.data.sport;

import br.edu.ifs.playifs.config.SecurityConstants;
import br.edu.ifs.playifs.data.sport.dto.SportDetailsDTO;
import br.edu.ifs.playifs.data.sport.dto.SportInputBatchDTO;
import br.edu.ifs.playifs.data.sport.dto.SportInputDTO;
import br.edu.ifs.playifs.data.sport.dto.SportSummaryDTO;
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
@RequestMapping(value = "/api/v1/sports")
@Tag(name = "7. Administração (Dados Base) - Desportos", description = "Endpoints para a gestão de modalidades desportivas.")
@SecurityRequirement(name = SecurityConstants.SECURITY_SCHEME_NAME)
@Validated
public class SportController {

    @Autowired
    private SportService service;

    @GetMapping
    @Operation(summary = "Lista todos os desportos (versão resumida)")
    @IsAuthenticated
    public ResponseEntity<ApiResponseBody<PageDTO<SportSummaryDTO>>> findAll(
            @Parameter(description = "Texto para buscar no nome do desporto") @RequestParam(defaultValue = "") String name,
            Pageable pageable) {
        PageDTO<SportSummaryDTO> page = service.findAll(name, pageable);
        page.getContent().forEach(sport ->
                sport.add(linkTo(methodOn(SportController.class).findById(sport.getId())).withSelfRel())
        );
        return ResponseEntity.ok(new ApiResponseBody<>(page));
    }

    @GetMapping(value = "/{id}")
    @Operation(summary = "Busca os detalhes de um desporto por ID")
    @ApiResponses(value = { @ApiResponse(responseCode = "200", description = "Desporto encontrado"), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError") })
    @IsAuthenticated
    public ResponseEntity<ApiResponseBody<SportDetailsDTO>> findById(@PathVariable @Positive Long id) {
        SportDetailsDTO dto = service.findById(id);
        addLinksToSportDetails(dto);
        return ResponseEntity.ok(new ApiResponseBody<>(dto));
    }

    @PostMapping
    @Operation(summary = "Cria um novo desporto")
    @ApiResponses(value = { @ApiResponse(responseCode = "201", description = "Desporto criado com sucesso"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError") })
    @IsCoordinator
    public ResponseEntity<ApiResponseBody<SportDetailsDTO>> insert(@Valid @RequestBody SportInputDTO dto) {
        SportDetailsDTO newDto = service.insert(dto);
        addLinksToSportDetails(newDto);
        URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(newDto.getId()).toUri();
        return ResponseEntity.created(uri).body(new ApiResponseBody<>(newDto, "Desporto criado com sucesso!"));
    }

    @PostMapping("/batch-create")
    @Operation(summary = "Cria novos desportos em massa (Coordenador)")
    @ApiResponses({
            @ApiResponse(responseCode = "201", description = "Desportos criados com sucesso"),
            @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")
    })
    @IsCoordinator
    public ResponseEntity<ApiResponseBody<List<SportDetailsDTO>>> batchInsert(@Valid @RequestBody SportInputBatchDTO batchDto) {
        List<SportDetailsDTO> newDtos = service.batchInsert(batchDto.getSports());

        // Adiciona links HATEOAS a cada desporto criado
        newDtos.forEach(this::addLinksToSportDetails);

        return ResponseEntity.status(HttpStatus.CREATED).body(new ApiResponseBody<>(newDtos, newDtos.size() + " desportos criados com sucesso!"));
    }

    @PutMapping(value = "/{id}")
    @Operation(summary = "Atualiza um desporto")
    @ApiResponses(value = { @ApiResponse(responseCode = "200", description = "Desporto atualizado"), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError") })
    @IsCoordinator
    public ResponseEntity<ApiResponseBody<SportDetailsDTO>> update(@PathVariable @Positive Long id, @Valid @RequestBody SportInputDTO dto) {
        SportDetailsDTO updatedDto = service.update(id, dto);
        addLinksToSportDetails(updatedDto);
        return ResponseEntity.ok(new ApiResponseBody<>(updatedDto, "Desporto atualizado com sucesso!"));
    }

    @DeleteMapping(value = "/{id}")
    @Operation(summary = "Apaga um desporto")
    @ApiResponses(value = { @ApiResponse(responseCode = "204", description = "Desporto apagado"), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError") })
    @IsCoordinator
    public ResponseEntity<Void> delete(@PathVariable @Positive Long id) {
        service.delete(id);
        return ResponseEntity.noContent().build();
    }

    @PostMapping("/batch-delete")
    @Operation(summary = "Apaga desportos em massa (Coordenador)")
    @ApiResponses({
            @ApiResponse(responseCode = "204", description = "Desportos apagados com sucesso"),
            @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")
    })
    @IsCoordinator
    public ResponseEntity<Void> batchDelete(@Valid @RequestBody br.edu.ifs.playifs.shared.web.dto.IdBatchDTO batchDto) {
        service.batchDelete(batchDto.getIds());
        return ResponseEntity.noContent().build();
    }

    // Método auxiliar para evitar repetição de código
    private void addLinksToSportDetails(SportDetailsDTO dto) {
        dto.add(linkTo(methodOn(SportController.class).findById(dto.getId())).withSelfRel());
        dto.add(linkTo(methodOn(SportController.class).findAll(null, Pageable.unpaged())).withRel("sports"));
    }
}