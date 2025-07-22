package br.edu.ifs.playifs.controllers;

import br.edu.ifs.playifs.dto.DesignatedCoachDTO;
import br.edu.ifs.playifs.services.DesignatedCoachService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "/designated-coaches")
public class DesignatedCoachController {

    @Autowired
    private DesignatedCoachService service;

    @GetMapping
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<Page<DesignatedCoachDTO>> findAll(
            @RequestParam(value = "competitionId", required = false) Long competitionId,
            @RequestParam(value = "sportId", required = false) Long sportId,
            @RequestParam(value = "courseId", required = false) Long courseId,
            Pageable pageable) {
        Page<DesignatedCoachDTO> page = service.findAll(competitionId, sportId, courseId, pageable);
        return ResponseEntity.ok(page);
    }

    @GetMapping(value = "/{id}")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<DesignatedCoachDTO> findById(@PathVariable Long id) {
        DesignatedCoachDTO dto = service.findById(id);
        return ResponseEntity.ok(dto);
    }

    @PostMapping
    @PreAuthorize("hasRole('COORDINATOR')")
    public ResponseEntity<DesignatedCoachDTO> defineCoach(@RequestBody DesignatedCoachDTO dto) {
        DesignatedCoachDTO newDto = service.defineCoach(dto);
        return ResponseEntity.status(HttpStatus.CREATED).body(newDto);
    }

    @PutMapping
    @PreAuthorize("hasRole('COORDINATOR')")
    public ResponseEntity<DesignatedCoachDTO> updateCoach(@RequestBody DesignatedCoachDTO dto) {
        DesignatedCoachDTO updatedDto = service.updateCoach(dto);
        return ResponseEntity.ok(updatedDto);
    }

    @DeleteMapping
    @PreAuthorize("hasRole('COORDINATOR')")
    public ResponseEntity<Void> removeCoach(
            @RequestParam Long competitionId,
            @RequestParam Long sportId,
            @RequestParam Long courseId) {
        service.removeCoach(competitionId, sportId, courseId);
        return ResponseEntity.noContent().build();
    }
}