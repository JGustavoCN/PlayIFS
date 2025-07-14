package br.edu.ifs.playifs.controllers;

import br.edu.ifs.playifs.dto.CoordinatorDTO;
import br.edu.ifs.playifs.dto.CoordinatorInsertDTO;
import br.edu.ifs.playifs.services.CoordinatorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;
import java.util.List;

@RestController
@RequestMapping(value = "/coordinators")
public class CoordinatorController {

    @Autowired
    private CoordinatorService service;

    @GetMapping
    public ResponseEntity<List<CoordinatorDTO>> findAll() {
        List<CoordinatorDTO> list = service.findAll();
        return ResponseEntity.ok(list);
    }

    @GetMapping(value = "/{id}")
    public ResponseEntity<CoordinatorDTO> findById(@PathVariable Long id) {
        CoordinatorDTO dto = service.findById(id);
        return ResponseEntity.ok(dto);
    }

    @PostMapping
    public ResponseEntity<CoordinatorDTO> insert(@RequestBody CoordinatorInsertDTO dto) {
        CoordinatorDTO newDto = service.insert(dto);
        URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}")
                .buildAndExpand(newDto.getId()).toUri();
        return ResponseEntity.created(uri).body(newDto);
    }

    @PutMapping(value = "/{id}")
    public ResponseEntity<CoordinatorDTO> update(@PathVariable Long id, @RequestBody CoordinatorDTO dto) {
        CoordinatorDTO newDto = service.update(id, dto);
        return ResponseEntity.ok(newDto);
    }

    @DeleteMapping(value = "/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        service.delete(id);
        return ResponseEntity.noContent().build();
    }
}
