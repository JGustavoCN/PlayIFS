package br.edu.ifs.playifs.data.course;

import br.edu.ifs.playifs.config.SecurityConstants;
import br.edu.ifs.playifs.data.course.dto.CourseDTO;
import br.edu.ifs.playifs.security.annotations.IsAuthenticated;
import br.edu.ifs.playifs.security.annotations.IsCoordinator;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
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
@RequestMapping(value = "/courses")
@Tag(name = "7. Administração (Dados Base) - Cursos", description = "Endpoints para a gestão de Cursos.")
@SecurityRequirement(name = SecurityConstants.SECURITY_SCHEME_NAME)
@Validated // Ativa a validação para @RequestParam e @PathVariable
public class CourseController {

    @Autowired
    private CourseService service;

    @GetMapping
    @Operation(summary = "Lista todos os cursos", description = "Retorna uma lista paginada de todos os cursos, com filtros. Requer autenticação.")
    @IsAuthenticated
    public ResponseEntity<Page<CourseDTO>> findAll(
            @Parameter(description = "Texto para buscar no nome do curso.") @RequestParam(value = "name", required = false) String name,
            @Parameter(description = "ID do campus para filtrar os cursos.") @RequestParam(value = "campusId", required = false) @Positive Long campusId,
            Pageable pageable) {
        Page<CourseDTO> page = service.findAll(name, campusId, pageable);
        return ResponseEntity.ok(page);
    }

    @GetMapping(value = "/{id}")
    @Operation(summary = "Busca um curso por ID")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Curso encontrado com sucesso."),
            @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError")
    })
    @IsAuthenticated
    public ResponseEntity<CourseDTO> findById(@PathVariable @Positive Long id) {
        CourseDTO dto = service.findById(id);
        return ResponseEntity.ok(dto);
    }

    @PostMapping
    @Operation(summary = "Cria um novo curso (Coordenador)")
    @ApiResponses({
            @ApiResponse(responseCode = "201", description = "Curso criado com sucesso."),
            @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")
    })
    @IsCoordinator
    public ResponseEntity<CourseDTO> insert(@Valid @RequestBody CourseDTO dto) {
        dto = service.insert(dto);
        URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}")
                .buildAndExpand(dto.getId()).toUri();
        return ResponseEntity.created(uri).body(dto);
    }

    @PutMapping(value = "/{id}")
    @Operation(summary = "Atualiza um curso existente (Coordenador)")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Curso atualizado com sucesso."),
            @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError"),
            @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")
    })
    @IsCoordinator
    public ResponseEntity<CourseDTO> update(@PathVariable @Positive Long id, @Valid @RequestBody CourseDTO dto) {
        dto = service.update(id, dto);
        return ResponseEntity.ok(dto);
    }

    @DeleteMapping(value = "/{id}")
    @Operation(summary = "Apaga um curso (Coordenador)")
    @ApiResponses({
            @ApiResponse(responseCode = "204", description = "Curso apagado com sucesso."),
            @ApiResponse(responseCode = "404", ref = "#/components/responses/NotFoundError"),
            @ApiResponse(responseCode = "422", ref = "#/components/responses/UnprocessableEntityError")
    })
    @IsCoordinator
    public ResponseEntity<Void> delete(@PathVariable @Positive Long id) {
        service.delete(id);
        return ResponseEntity.noContent().build();
    }
}