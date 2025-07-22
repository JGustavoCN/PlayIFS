package br.edu.ifs.playifs.controllers;

import br.edu.ifs.playifs.dto.CoordinatorDTO;
import br.edu.ifs.playifs.dto.CoordinatorInsertDTO;
import br.edu.ifs.playifs.entities.User;
import br.edu.ifs.playifs.services.CoordinatorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;

@RestController
@RequestMapping(value = "/coordinators")
public class CoordinatorController {

    @Autowired
    private CoordinatorService service;

    @GetMapping(value = "/{id}")
    @PreAuthorize("hasRole('COORDINATOR')")
    public ResponseEntity<CoordinatorDTO> findById(@PathVariable Long id) {
        CoordinatorDTO dto = service.findById(id);
        return ResponseEntity.ok(dto);
    }

    @GetMapping
    @PreAuthorize("hasRole('COORDINATOR')")
    public ResponseEntity<Page<CoordinatorDTO>> findAll(
            @RequestParam(value = "name", defaultValue = "") String name,
            Pageable pageable) {
        Page<CoordinatorDTO> page = service.findAll(name, pageable);
        return ResponseEntity.ok(page);
    }

    @PostMapping
    @PreAuthorize("hasRole('COORDINATOR')")
    public ResponseEntity<CoordinatorDTO> insert(@RequestBody CoordinatorInsertDTO dto) {
        CoordinatorDTO newDto = service.insert(dto);
        URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}")
                .buildAndExpand(newDto.getId()).toUri();
        return ResponseEntity.created(uri).body(newDto);
    }

    @PutMapping(value = "/{id}")
    @PreAuthorize("hasRole('COORDINATOR')")
    public ResponseEntity<CoordinatorDTO> update(@PathVariable Long id, @RequestBody CoordinatorDTO dto) {
        dto = service.update(id, dto);
        return ResponseEntity.ok(dto);
    }

    @DeleteMapping(value = "/{id}")
    @PreAuthorize("hasRole('COORDINATOR')")
    public ResponseEntity<Void> delete(@PathVariable Long id, @AuthenticationPrincipal User loggedUser) {
        service.delete(id, loggedUser);
        return ResponseEntity.noContent().build();
    }
}