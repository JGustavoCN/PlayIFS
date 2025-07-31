package br.edu.ifs.playifs.data.sport;

import br.edu.ifs.playifs.data.sport.dto.SportDetailsDTO;
import br.edu.ifs.playifs.data.sport.dto.SportInputDTO;
import br.edu.ifs.playifs.data.sport.dto.SportSummaryDTO;
import br.edu.ifs.playifs.data.sport.model.Sport;
import br.edu.ifs.playifs.shared.exceptions.BusinessException;
import br.edu.ifs.playifs.shared.exceptions.ResourceNotFoundException;
import br.edu.ifs.playifs.shared.web.dto.PageDTO;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class SportService {

    @Autowired
    private SportRepository repository;

    @Transactional(readOnly = true)
    public PageDTO<SportSummaryDTO> findAll(String name, Pageable pageable) {
        Page<Sport> page = repository.findByNameContainingIgnoreCase(name, pageable);
        Page<SportSummaryDTO> pageDto = page.map(SportSummaryDTO::new);
        return new PageDTO<>(pageDto);
    }

    @Transactional(readOnly = true)
    public SportDetailsDTO findById(Long id) {
        Sport entity = repository.findById(id).orElseThrow(
                () -> new ResourceNotFoundException("Desporto não encontrado com o ID: " + id));
        return new SportDetailsDTO(entity);
    }

    @Transactional
    public SportDetailsDTO insert(SportInputDTO dto) {
        Sport entity = new Sport();
        copyDtoToEntity(dto, entity);
        entity = repository.save(entity);
        return new SportDetailsDTO(entity);
    }

    @Transactional
    public SportDetailsDTO update(Long id, SportInputDTO dto) {
        try {
            Sport entity = repository.getReferenceById(id);
            copyDtoToEntity(dto, entity);
            entity = repository.save(entity);
            return new SportDetailsDTO(entity);
        } catch (EntityNotFoundException e) {
            throw new ResourceNotFoundException("Recurso não encontrado com o ID: " + id);
        }
    }

    @Transactional
    public void delete(Long id) {
        if (!repository.existsById(id)) {
            throw new ResourceNotFoundException("Recurso não encontrado com o ID: " + id);
        }
        Sport sport = repository.findById(id).get();
        if (!sport.getTeams().isEmpty()) {
            throw new BusinessException("Não é possível apagar um desporto que já está associado a equipas.");
        }
        repository.deleteById(id);
    }

    private void copyDtoToEntity(SportInputDTO dto, Sport entity) {
        entity.setName(dto.getName());
        entity.setMinAthletes(dto.getMinAthletes());
        entity.setMaxAthletes(dto.getMaxAthletes());
    }
}