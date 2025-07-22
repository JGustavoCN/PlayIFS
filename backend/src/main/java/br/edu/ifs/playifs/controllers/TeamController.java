package br.edu.ifs.playifs.controllers;

import br.edu.ifs.playifs.dto.AthleteListDTO;
import br.edu.ifs.playifs.dto.TeamDTO;
import br.edu.ifs.playifs.dto.TeamInsertDTO;
import br.edu.ifs.playifs.dto.TeamUpdateDTO;
import br.edu.ifs.playifs.entities.User;
import br.edu.ifs.playifs.services.TeamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;

@RestController
@RequestMapping(value = "/teams")
public class TeamController {

    @Autowired
    private TeamService service;

    @GetMapping(value = "/{id}")
    public ResponseEntity<TeamDTO> findById(@PathVariable Long id) {
        TeamDTO dto = service.findById(id);
        return ResponseEntity.ok(dto);
    }

    @GetMapping
    public ResponseEntity<Page<TeamDTO>> findAll(
            @RequestParam(value = "competitionId", required = false) Long competitionId,
            @RequestParam(value = "sportId", required = false) Long sportId,
            @RequestParam(value = "courseId", required = false) Long courseId,
            Pageable pageable) {
        Page<TeamDTO> page = service.findAll(competitionId, sportId, courseId, pageable);
        return ResponseEntity.ok(page);
    }

    @PostMapping
    @PreAuthorize("hasRole('ATHLETE')")
    public ResponseEntity<TeamDTO> insert(@RequestBody TeamInsertDTO dto, @AuthenticationPrincipal User loggedUser) {
        TeamDTO newDto = service.insert(dto, loggedUser);
        URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}")
                .buildAndExpand(newDto.getId()).toUri();
        return ResponseEntity.created(uri).body(newDto);
    }

    @PutMapping(value = "/{id}")
    @PreAuthorize("hasRole('ATHLETE') and @teamService.isCoachOfTeam(authentication.principal, #id)")
    public ResponseEntity<TeamDTO> update(@PathVariable Long id, @RequestBody TeamUpdateDTO dto) {
        TeamDTO newDto = service.update(id, dto);
        return ResponseEntity.ok(newDto);
    }

    @PostMapping(value = "/{id}/athletes")
    @PreAuthorize("hasRole('ATHLETE') and @teamService.isCoachOfTeam(authentication.principal, #id)")
    public ResponseEntity<TeamDTO> addAthletes(@PathVariable Long id, @RequestBody AthleteListDTO dto) {
        TeamDTO newDto = service.addAthletes(id, dto.getAthleteIds());
        return ResponseEntity.ok(newDto);
    }

    @DeleteMapping(value = "/{id}/athletes/{athleteId}")
    @PreAuthorize("hasRole('ATHLETE') and @teamService.isCoachOfTeam(authentication.principal, #id)")
    public ResponseEntity<Void> removeAthlete(@PathVariable Long id, @PathVariable Long athleteId) {
        service.removeAthlete(id, athleteId);
        return ResponseEntity.noContent().build();
    }

    @DeleteMapping(value = "/{id}")
    @PreAuthorize("hasRole('ATHLETE') and @teamService.isCoachOfTeam(authentication.principal, #id) or hasRole('COORDINATOR')")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        service.delete(id);
        return ResponseEntity.noContent().build();
    }
}