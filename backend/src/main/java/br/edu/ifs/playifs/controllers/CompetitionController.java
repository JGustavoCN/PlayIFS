package br.edu.ifs.playifs.controllers;

import br.edu.ifs.playifs.dto.CompetitionDTO;
import br.edu.ifs.playifs.dto.DesignatedCoachDTO;
import br.edu.ifs.playifs.dto.GameDTO;
import br.edu.ifs.playifs.services.CompetitionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;
import java.util.List;

@RestController
@RequestMapping(value = "/competitions")
public class CompetitionController {

    @Autowired
    private CompetitionService service;

    // --- ENDPOINTS DE CRUD PARA COMPETITION ---

    @GetMapping
    public ResponseEntity<Page<CompetitionDTO>> findAll(
            @RequestParam(value = "name", defaultValue = "") String name,
            Pageable pageable) {
        Page<CompetitionDTO> page = service.findAll(name, pageable);
        return ResponseEntity.ok(page);
    }

    @GetMapping(value = "/{id}")
    public ResponseEntity<CompetitionDTO> findById(@PathVariable Long id) {
        CompetitionDTO dto = service.findById(id);
        return ResponseEntity.ok(dto);
    }

    @PostMapping
    @PreAuthorize("hasRole('COORDINATOR')")
    public ResponseEntity<CompetitionDTO> insert(@RequestBody CompetitionDTO dto) {
        dto = service.insert(dto);
        URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}")
                .buildAndExpand(dto.getId()).toUri();
        return ResponseEntity.created(uri).body(dto);
    }

    @PutMapping(value = "/{id}")
    @PreAuthorize("hasRole('COORDINATOR')")
    public ResponseEntity<CompetitionDTO> update(@PathVariable Long id, @RequestBody CompetitionDTO dto) {
        dto = service.update(id, dto);
        return ResponseEntity.ok(dto);
    }

    @DeleteMapping(value = "/{id}")
    @PreAuthorize("hasRole('COORDINATOR')")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        service.delete(id);
        return ResponseEntity.noContent().build();
    }

    // --- ENDPOINTS DE LÓGICA DE NEGÓCIO (JÁ IMPLEMENTADOS) ---

    @PostMapping(value = "/{competitionId}/sports/{sportId}/generate-groups")
    @PreAuthorize("hasRole('COORDINATOR')")
    public ResponseEntity<List<GameDTO>> generateGroupStage(@PathVariable Long competitionId, @PathVariable Long sportId) {
        List<GameDTO> generatedGames = service.generateGroupStage(competitionId, sportId);
        return ResponseEntity.ok(generatedGames);
    }

    @PostMapping(value = "/{competitionId}/sports/{sportId}/generate-elimination")
    @PreAuthorize("hasRole('COORDINATOR')")
    public ResponseEntity<List<GameDTO>> generateEliminationStage(@PathVariable Long competitionId, @PathVariable Long sportId) {
        List<GameDTO> eliminationGames = service.generateEliminationStage(competitionId, sportId);
        return ResponseEntity.ok(eliminationGames);
    }

}