package br.edu.ifs.playifs.controllers;

import br.edu.ifs.playifs.dto.CampusDTO;
import br.edu.ifs.playifs.services.CampusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;

@RestController
@RequestMapping(value = "/campuses")
public class CampusController {

    @Autowired
    private CampusService service;

    @GetMapping(value = "/{id}")
    public ResponseEntity<CampusDTO> findById(@PathVariable Long id) {
        CampusDTO dto = service.findById(id);
        return ResponseEntity.ok(dto);
    }

    @GetMapping
    public ResponseEntity<Page<CampusDTO>> findAll(
            @RequestParam(value = "name", defaultValue = "") String name,
            Pageable pageable) {
        Page<CampusDTO> page = service.findAll(name, pageable);
        return ResponseEntity.ok(page);
    }

    @PostMapping
    @PreAuthorize("hasRole('COORDINATOR')")
    public ResponseEntity<CampusDTO> insert(@RequestBody CampusDTO dto) {
        dto = service.insert(dto);
        URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}")
                .buildAndExpand(dto.getId()).toUri();
        return ResponseEntity.created(uri).body(dto);
    }

    @PutMapping(value = "/{id}")
    @PreAuthorize("hasRole('COORDINATOR')")
    public ResponseEntity<CampusDTO> update(@PathVariable Long id, @RequestBody CampusDTO dto) {
        dto = service.update(id, dto);
        return ResponseEntity.ok(dto);
    }

    @DeleteMapping(value = "/{id}")
    @PreAuthorize("hasRole('COORDINATOR')")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        service.delete(id);
        return ResponseEntity.noContent().build();
    }
}