package br.edu.ifs.playifs.controllers;

import br.edu.ifs.playifs.dto.AthleteDTO;
import br.edu.ifs.playifs.dto.AthleteInsertDTO;
import br.edu.ifs.playifs.services.AthleteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;
import java.util.List;

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
    public ResponseEntity<List<AthleteDTO>> findAll() {
        List<AthleteDTO> list = service.findAll();
        return ResponseEntity.ok(list);
    }

    @PostMapping
    public ResponseEntity<AthleteDTO> insert(@RequestBody AthleteInsertDTO dto) {
        // Usamos o DTO de inserção para receber a senha
        AthleteDTO newDto = service.insert(dto);
        URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}")
                .buildAndExpand(newDto.getId()).toUri();
        // Retornamos o DTO normal, sem a senha
        return ResponseEntity.created(uri).body(newDto);
    }

    @PutMapping(value = "/{id}")
    public ResponseEntity<AthleteDTO> update(@PathVariable Long id, @RequestBody AthleteDTO dto) {
        dto = service.update(id, dto);
        return ResponseEntity.ok(dto);
    }

    @DeleteMapping(value = "/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        service.delete(id);
        return ResponseEntity.noContent().build();
    }
}