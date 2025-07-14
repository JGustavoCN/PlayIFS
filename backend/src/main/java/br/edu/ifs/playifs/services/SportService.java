// src/main/java/br/edu/ifs/playifs/services/SportService.java
package br.edu.ifs.playifs.services;

import br.edu.ifs.playifs.dto.SportDTO;
import br.edu.ifs.playifs.entities.Sport;
import br.edu.ifs.playifs.repositories.SportRepository;
import br.edu.ifs.playifs.services.exceptions.DatabaseException;
import br.edu.ifs.playifs.services.exceptions.ResourceNotFoundException;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class SportService {

    @Autowired
    private SportRepository repository;

    @Transactional(readOnly = true)
    public SportDTO findById(Long id) {
        Sport sport = repository.findById(id).orElseThrow(
                () -> new ResourceNotFoundException("Recurso não encontrado"));
        return new SportDTO(sport);
    }

    @Transactional(readOnly = true)
    public List<SportDTO> findAll() {
        List<Sport> list = repository.findAll();
        return list.stream().map(SportDTO::new).collect(Collectors.toList());
    }

    @Transactional
    public SportDTO insert(SportDTO dto) {
        Sport entity = new Sport();
        copyDtoToEntity(dto, entity);
        entity = repository.save(entity);
        return new SportDTO(entity);
    }

    @Transactional
    public SportDTO update(Long id, SportDTO dto) {
        try {
            Sport entity = repository.getReferenceById(id);
            copyDtoToEntity(dto, entity);
            entity = repository.save(entity);
            return new SportDTO(entity);
        } catch (EntityNotFoundException e) {
            throw new ResourceNotFoundException("Recurso não encontrado");
        }
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    public void delete(Long id) {
        if (!repository.existsById(id)) {
            throw new ResourceNotFoundException("Recurso não encontrado");
        }
        try {
            repository.deleteById(id);
        }
        catch (DataIntegrityViolationException e) {
            throw new DatabaseException("Falha de integridade referencial");
        }
    }

    private void copyDtoToEntity(SportDTO dto, Sport entity) {
        entity.setName(dto.getName());
        entity.setMinAthletes(dto.getMinAthletes());
        entity.setMaxAthletes(dto.getMaxAthletes());
    }
}