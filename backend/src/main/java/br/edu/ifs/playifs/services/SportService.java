package br.edu.ifs.playifs.services;

import br.edu.ifs.playifs.dto.SportDTO;
import br.edu.ifs.playifs.entities.Sport;
import br.edu.ifs.playifs.repositories.SportRepository;
import br.edu.ifs.playifs.services.exceptions.BusinessException;
import br.edu.ifs.playifs.services.exceptions.ResourceNotFoundException;
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
    public SportDTO findById(Long id) {
        Sport entity = repository.findById(id).orElseThrow(
                () -> new ResourceNotFoundException("Desporto não encontrado com o ID: " + id));
        return new SportDTO(entity);
    }

    @Transactional(readOnly = true)
    public Page<SportDTO> findAll(String name, Pageable pageable) {
        Page<Sport> page = repository.findByNameContainingIgnoreCase(name, pageable);
        return page.map(SportDTO::new);
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
            throw new ResourceNotFoundException("Recurso não encontrado com o ID: " + id);
        }
    }

    @Transactional
    public void delete(Long id) {
        if (!repository.existsById(id)) {
            throw new ResourceNotFoundException("Recurso não encontrado com o ID: " + id);
        }
        // Validação de Negócio: Não apagar desportos em uso.
        // O Spring Data JPA lançaria uma DataIntegrityViolationException, mas esta
        // mensagem é mais clara para o usuário.
        if (repository.findById(id).get().getTeams().isEmpty() == false) {
            throw new BusinessException("Não é possível apagar um desporto que já está associado a equipas.");
        }
        repository.deleteById(id);
    }

    private void copyDtoToEntity(SportDTO dto, Sport entity) {
        entity.setName(dto.getName());
        entity.setMinAthletes(dto.getMinAthletes());
        entity.setMaxAthletes(dto.getMaxAthletes());
    }
}