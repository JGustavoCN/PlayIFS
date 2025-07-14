package br.edu.ifs.playifs.controllers;

import br.edu.ifs.playifs.dto.GameDTO;
import br.edu.ifs.playifs.dto.GameResultDTO;
import br.edu.ifs.playifs.dto.GameWoDTO;
import br.edu.ifs.playifs.services.GameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize; // Importar
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "/games")
public class GameController {

    @Autowired
    private GameService service;

    // Adicionando a proteção de segurança diretamente no método
    @PreAuthorize("hasRole('COORDINATOR')")
    @PatchMapping(value = "/{id}/result")
    public ResponseEntity<GameDTO> updateResult(@PathVariable Long id, @RequestBody GameResultDTO dto) {
        GameDTO updatedDto = service.updateResult(id, dto);
        return ResponseEntity.ok(updatedDto);
    }

    // Adicionando a proteção de segurança diretamente no método
    @PreAuthorize("hasRole('COORDINATOR')")
    @PatchMapping(value = "/{id}/wo")
    public ResponseEntity<GameDTO> registerWo(@PathVariable Long id, @RequestBody GameWoDTO dto) {
        GameDTO updatedDto = service.registerWo(id, dto);
        return ResponseEntity.ok(updatedDto);
    }

    // Adicionando a proteção de segurança diretamente no método
    @PreAuthorize("hasRole('COORDINATOR')")
    @PatchMapping(value = "/{id}/undo-wo")
    public ResponseEntity<GameDTO> undoWo(@PathVariable Long id) {
        GameDTO updatedDto = service.undoWo(id);
        return ResponseEntity.ok(updatedDto);
    }
}