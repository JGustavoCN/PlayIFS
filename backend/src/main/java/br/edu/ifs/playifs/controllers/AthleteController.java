package br.edu.ifs.playifs.controllers;

import br.edu.ifs.playifs.dto.AthleteDTO;
import br.edu.ifs.playifs.dto.AthleteInsertDTO;
import br.edu.ifs.playifs.services.AthleteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;

@RestController
@RequestMapping(value = "/athletes")
public class AthleteController {

    @Autowired
    private AthleteService service;

    @GetMapping(value = "/{id}")
    public ResponseEntity<AthleteDTO> findById(@PathVariable Long id) {
        AthleteDTO dto = service.findById(id);
        return ResponseEntity.ok(dto);
    }

    @GetMapping
    public ResponseEntity<Page<AthleteDTO>> findAll(
            @RequestParam(value = "name", defaultValue = "") String name,
            Pageable pageable) {
        Page<AthleteDTO> page = service.findAll(name, pageable);
        return ResponseEntity.ok(page);
    }

    @PostMapping
    public ResponseEntity<AthleteDTO> insert(@RequestBody AthleteInsertDTO dto) {
        AthleteDTO newDto = service.insert(dto);
        URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}")
                .buildAndExpand(newDto.getId()).toUri();
        return ResponseEntity.created(uri).body(newDto);
    }

    @PutMapping(value = "/{id}")
    @PreAuthorize("hasRole('COORDINATOR')")
    public ResponseEntity<AthleteDTO> update(@PathVariable Long id, @RequestBody AthleteDTO dto) {
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