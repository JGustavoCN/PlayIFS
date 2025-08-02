package br.edu.ifs.playifs.data.course;

import br.edu.ifs.playifs.config.SecurityConstants;
import br.edu.ifs.playifs.data.campus.CampusController;
import br.edu.ifs.playifs.data.course.dto.CourseDetailsDTO;
import br.edu.ifs.playifs.data.course.dto.CourseInputDTO;
import br.edu.ifs.playifs.data.course.dto.CourseSummaryDTO;
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
@RequestMapping(value = "/api/v1/courses")
@Tag(name = "7. Administração (Dados Base) - Cursos", description = "Endpoints para a gestão de Cursos.")
@SecurityRequirement(name = SecurityConstants.SECURITY_SCHEME_NAME)
@Validated
public class CourseController {

    @Autowired
    private CourseService service;

    @GetMapping
    @Operation(summary = "Lista todos os cursos (versão resumida)")
    @IsAuthenticated
    public ResponseEntity<ApiResponseBody<PageDTO<CourseSummaryDTO>>> findAll(
            @Parameter(description = "Texto para buscar no nome do curso.") @RequestParam(required = false) String name,
            @Parameter(description = "ID do campus para filtrar os cursos.") @RequestParam(required = false) @Positive Long campusId,
            Pageable pageable) {
        PageDTO<CourseSummaryDTO> page = service.findAll(name, campusId, pageable);
        page.getContent().forEach(course ->
                course.add(linkTo(methodOn(CourseController.class).findById(course.getId())).withSelfRel())
        );
        return ResponseEntity.ok(new ApiResponseBody<>(page));
    }

    @GetMapping(value = "/{id}")
    @Operation(summary = "Busca os detalhes de um curso por ID")
    @ApiResponses({@ApiResponse(responseCode = "200", description = "Curso encontrado"), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError")})
    @IsAuthenticated
    public ResponseEntity<ApiResponseBody<CourseDetailsDTO>> findById(@PathVariable @Positive Long id) {
        CourseDetailsDTO dto = service.findById(id);
        addLinksToCourseDetails(dto);
        return ResponseEntity.ok(new ApiResponseBody<>(dto));
    }

    @PostMapping
    @Operation(summary = "Cria um novo curso (Coordenador)")
    @ApiResponses({@ApiResponse(responseCode = "201", description = "Curso criado"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")})
    @IsCoordinator
    public ResponseEntity<ApiResponseBody<CourseDetailsDTO>> insert(@Valid @RequestBody CourseInputDTO dto) {
        CourseDetailsDTO newDto = service.insert(dto);
        addLinksToCourseDetails(newDto);
        URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(newDto.getId()).toUri();
        return ResponseEntity.created(uri).body(new ApiResponseBody<>(newDto, "Curso criado com sucesso!"));
    }

    @PutMapping(value = "/{id}")
    @Operation(summary = "Atualiza um curso existente (Coordenador)")
    @ApiResponses({@ApiResponse(responseCode = "200", description = "Curso atualizado"), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")})
    @IsCoordinator
    public ResponseEntity<ApiResponseBody<CourseDetailsDTO>> update(@PathVariable @Positive Long id, @Valid @RequestBody CourseInputDTO dto) {
        CourseDetailsDTO updatedDto = service.update(id, dto);
        addLinksToCourseDetails(updatedDto);
        return ResponseEntity.ok(new ApiResponseBody<>(updatedDto, "Curso atualizado com sucesso!"));
    }

    @DeleteMapping(value = "/{id}")
    @Operation(summary = "Apaga um curso (Coordenador)")
    @ApiResponses({@ApiResponse(responseCode = "204", description = "Curso apagado"), @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError"), @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")})
    @IsCoordinator
    public ResponseEntity<Void> delete(@PathVariable @Positive Long id) {
        service.delete(id);
        return ResponseEntity.noContent().build();
    }

    // Método auxiliar para evitar repetição de código
    private void addLinksToCourseDetails(CourseDetailsDTO dto) {
        dto.add(linkTo(methodOn(CourseController.class).findById(dto.getId())).withSelfRel());
        dto.add(linkTo(methodOn(CourseController.class).findAll(null, null, Pageable.unpaged())).withRel("courses"));
        if (dto.getCampus() != null) {
            dto.getCampus().add(linkTo(methodOn(CampusController.class).findById(dto.getCampus().getId())).withSelfRel());
        }
    }
}