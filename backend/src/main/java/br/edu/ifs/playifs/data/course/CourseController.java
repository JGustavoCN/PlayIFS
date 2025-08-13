package br.edu.ifs.playifs.data.course;

import br.edu.ifs.playifs.config.SecurityConstants;
import br.edu.ifs.playifs.data.campus.CampusController;
import br.edu.ifs.playifs.data.course.dto.CourseDetailsDTO;
import br.edu.ifs.playifs.data.course.dto.CourseInputBatchDTO;
import br.edu.ifs.playifs.data.course.dto.CourseInputDTO;
import br.edu.ifs.playifs.data.course.dto.CourseSummaryDTO;
import br.edu.ifs.playifs.data.course.model.enums.CourseLevel;
import br.edu.ifs.playifs.security.annotations.IsAuthenticated;
import br.edu.ifs.playifs.security.annotations.IsCoordinator;
import br.edu.ifs.playifs.shared.web.dto.ApiResponseBody;
import br.edu.ifs.playifs.shared.web.dto.PageDTO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.Schema;
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
@RequestMapping(value = "/api/v1/courses")
@Tag(name = "7. Administração (Dados Base) - Cursos", description = "Endpoints para a gestão de Cursos.")
@SecurityRequirement(name = SecurityConstants.SECURITY_SCHEME_NAME)
@Validated
public class CourseController {

    @Autowired
    private CourseService service;


    @GetMapping
    @Operation(
            summary = "Lista todos os cursos com paginação",
            description = "Retorna uma lista paginada de cursos, com filtros opcionais.",
            parameters = {
                    @Parameter(name = "page", description = "Número da página (começa em 0).", example = "0"),
                    @Parameter(name = "size", description = "Tamanho da página.", example = "10"),
                    @Parameter(name = "sort", description = "Critério de ordenação. Ex: 'name,asc'.", example = "name,asc"),
                    @Parameter(name = "name", description = "Filtro por nome do curso."),
                    @Parameter(name = "campusId", description = "Filtro por ID do campus."),
                    @Parameter(
                            name = "level",
                            description = "Nível do curso para filtrar.",
                            schema = @Schema(implementation = CourseLevel.class)
                    )
            }
    )@IsAuthenticated
    public ResponseEntity<ApiResponseBody<PageDTO<CourseSummaryDTO>>> findAll(
            @RequestParam(required = false) String name,

            @RequestParam(required = false) @Positive Long campusId,

            @RequestParam(required = false) CourseLevel level,

            Pageable pageable) {

        PageDTO<CourseSummaryDTO> page = service.findAll(name, campusId, level, pageable);

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

    @PostMapping("/batch-create")
    @Operation(summary = "Cria novos cursos em massa (Coordenador)")
    @ApiResponses({
            @ApiResponse(responseCode = "201", description = "Cursos criados com sucesso"),
            @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")
    })
    @IsCoordinator
    public ResponseEntity<ApiResponseBody<List<CourseDetailsDTO>>> batchInsert(@Valid @RequestBody CourseInputBatchDTO batchDto) {
        List<CourseDetailsDTO> newDtos = service.batchInsert(batchDto.getCourses());

        // Adiciona links HATEOAS a cada curso criado
        newDtos.forEach(this::addLinksToCourseDetails);

        return ResponseEntity.status(HttpStatus.CREATED).body(new ApiResponseBody<>(newDtos, newDtos.size() + " cursos criados com sucesso!"));
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

    @PostMapping("/batch-delete")
    @Operation(summary = "Apaga cursos em massa (Coordenador)")
    @ApiResponses({
            @ApiResponse(responseCode = "204", description = "Cursos apagados com sucesso"),
            @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")
    })
    @IsCoordinator
    public ResponseEntity<Void> batchDelete(@Valid @RequestBody br.edu.ifs.playifs.shared.web.dto.IdBatchDTO batchDto) {
        service.batchDelete(batchDto.getIds());
        return ResponseEntity.noContent().build();
    }

    private void addLinksToCourseDetails(CourseDetailsDTO dto) {
        dto.add(linkTo(methodOn(CourseController.class).findById(dto.getId())).withSelfRel());
        dto.add(linkTo(methodOn(CourseController.class).findAll(null, null, null, Pageable.unpaged())).withRel("courses"));
        if (dto.getCampus() != null) {
            dto.getCampus().add(linkTo(methodOn(CampusController.class).findById(dto.getCampus().getId())).withSelfRel());
        }
    }
}