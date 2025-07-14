package br.edu.ifs.playifs.controllers;

import br.edu.ifs.playifs.dto.TeamDTO;
import br.edu.ifs.playifs.dto.TeamInsertDTO;
import br.edu.ifs.playifs.entities.User; // Importar User
import br.edu.ifs.playifs.services.TeamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal; // Importar
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;

@RestController
@RequestMapping(value = "/teams")
public class TeamController {

    @Autowired
    private TeamService service;

    @PostMapping
    @PreAuthorize("hasRole('ATHLETE')")
    public ResponseEntity<TeamDTO> insert(@RequestBody TeamInsertDTO dto, @AuthenticationPrincipal User loggedUser) {

        TeamDTO newDto = service.insert(dto, loggedUser);
        URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}")
                .buildAndExpand(newDto.getId()).toUri();
        return ResponseEntity.created(uri).body(newDto);
    }
}