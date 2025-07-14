package br.edu.ifs.playifs.controllers;

import br.edu.ifs.playifs.dto.DesignatedCoachDTO;
import br.edu.ifs.playifs.dto.GameDTO;
import br.edu.ifs.playifs.services.CompetitionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/competitions")
public class CompetitionController {

    @Autowired
    private CompetitionService service;

    @PostMapping(value = "/{id}/generate-groups")
    public ResponseEntity<List<GameDTO>> generateGroupStage(@PathVariable Long id) {
        List<GameDTO> generatedGames = service.generateGroupStage(id);
        return ResponseEntity.ok(generatedGames);
    }

    @PostMapping(value = "/{id}/generate-elimination")
    public ResponseEntity<List<GameDTO>> generateEliminationStage(@PathVariable Long id) {
        List<GameDTO> eliminationGames = service.generateEliminationStage(id);
        return ResponseEntity.ok(eliminationGames);
    }

    @PostMapping("/{id}/designated-coaches")
    @PreAuthorize("hasRole('COORDINATOR')")
    public ResponseEntity<Void> defineCoach(@PathVariable Long id, @RequestBody DesignatedCoachDTO dto) {
        service.defineCoach(id, dto);
        return ResponseEntity.noContent().build();
    }

}
