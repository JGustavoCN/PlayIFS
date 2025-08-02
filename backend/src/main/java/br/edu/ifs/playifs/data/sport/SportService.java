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

import java.util.List;
import java.util.stream.Collectors;

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
    public List<SportDetailsDTO> batchInsert(List<SportInputDTO> dtos) {
        List<Sport> entities = dtos.stream().map(dto -> {
            Sport entity = new Sport();
            // Usa o método copyDtoToEntity que já existe para evitar duplicação de código
            copyDtoToEntity(dto, entity);
            return entity;
        }).collect(Collectors.toList());

        List<Sport> savedEntities = repository.saveAll(entities);

        return savedEntities.stream()
                .map(SportDetailsDTO::new)
                .collect(Collectors.toList());
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

    @Transactional
    public void batchDelete(List<Long> ids) {
        List<Sport> sportsToDelete = repository.findAllById(ids);

        if (sportsToDelete.size() != ids.size()) {
            throw new ResourceNotFoundException("Um ou mais desportos não foram encontrados.");
        }

        // Validação de negócio: verifica se algum desporto possui equipas associadas
        for (Sport sport : sportsToDelete) {
            if (!sport.getTeams().isEmpty()) {
                throw new BusinessException("Não é possível apagar o desporto '" + sport.getName() + "' (ID: " + sport.getId() + ") pois ele já está associado a equipas.");
            }
        }

        repository.deleteAllInBatch(sportsToDelete);
    }

    private void copyDtoToEntity(SportInputDTO dto, Sport entity) {
        entity.setName(dto.getName());
        entity.setMinAthletes(dto.getMinAthletes());
        entity.setMaxAthletes(dto.getMaxAthletes());
    }
}