package br.edu.ifs.playifs.controllers;

import br.edu.ifs.playifs.dto.GameDTO;
import br.edu.ifs.playifs.dto.GameResultDTO;
import br.edu.ifs.playifs.dto.GameUpdateDTO;
import br.edu.ifs.playifs.dto.GameWoDTO;
import br.edu.ifs.playifs.services.GameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "/games")
public class GameController {

    @Autowired
    private GameService service;

    @GetMapping
    public ResponseEntity<Page<GameDTO>> findAll(
            @RequestParam(value = "teamId", required = false) Long teamId,
            Pageable pageable) {
        Page<GameDTO> page = service.findAll(teamId, pageable);
        return ResponseEntity.ok(page);
    }

    @GetMapping(value = "/{id}")
    public ResponseEntity<GameDTO> findById(@PathVariable Long id) {
        GameDTO dto = service.findById(id);
        return ResponseEntity.ok(dto);
    }

    @DeleteMapping(value = "/{id}")
    @PreAuthorize("hasRole('COORDINATOR')")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        service.delete(id);
        return ResponseEntity.noContent().build();
    }

    @PutMapping(value = "/{id}")
    @PreAuthorize("hasRole('COORDINATOR')")
    public ResponseEntity<GameDTO> update(@PathVariable Long id, @RequestBody GameUpdateDTO dto) {
        GameDTO newDto = service.update(id, dto);
        return ResponseEntity.ok(newDto);
    }

    @PatchMapping(value = "/{id}/result")
    @PreAuthorize("hasRole('COORDINATOR')")
    public ResponseEntity<GameDTO> updateResult(@PathVariable Long id, @RequestBody GameResultDTO dto) {
        GameDTO updatedDto = service.updateResult(id, dto);
        return ResponseEntity.ok(updatedDto);
    }

    @PatchMapping(value = "/{id}/wo")
    @PreAuthorize("hasRole('COORDINATOR')")
    public ResponseEntity<GameDTO> registerWo(@PathVariable Long id, @RequestBody GameWoDTO dto) {
        GameDTO updatedDto = service.registerWo(id, dto);
        return ResponseEntity.ok(updatedDto);
    }

    @PatchMapping(value = "/{id}/undo-wo")
    @PreAuthorize("hasRole('COORDINATOR')")
    public ResponseEntity<GameDTO> undoWo(@PathVariable Long id) {
        GameDTO updatedDto = service.undoWo(id);
        return ResponseEntity.ok(updatedDto);
    }
}