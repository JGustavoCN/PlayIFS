package br.edu.ifs.playifs.services;

import br.edu.ifs.playifs.dto.CampusDTO;
import br.edu.ifs.playifs.entities.Campus;
import br.edu.ifs.playifs.repositories.CampusRepository;
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
public class CampusService {

    @Autowired
    private CampusRepository repository;

    @Transactional(readOnly = true)
    public CampusDTO findById(Long id) {
        Campus campus = repository.findById(id).orElseThrow(
                () -> new ResourceNotFoundException("Recurso não encontrado"));
        return new CampusDTO(campus);
    }

    @Transactional(readOnly = true)
    public List<CampusDTO> findAll() {
        List<Campus> list = repository.findAll();
        return list.stream().map(CampusDTO::new).collect(Collectors.toList());
    }

    @Transactional
    public CampusDTO insert(CampusDTO dto) {
        Campus entity = new Campus();
        entity.setName(dto.getName());
        entity = repository.save(entity);
        return new CampusDTO(entity);
    }

    @Transactional
    public CampusDTO update(Long id, CampusDTO dto) {
        try {
            Campus entity = repository.getReferenceById(id);
            entity.setName(dto.getName());
            entity = repository.save(entity);
            return new CampusDTO(entity);
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
        } catch (DataIntegrityViolationException e) {
            throw new DatabaseException("Falha de integridade referencial");
        }
    }
}
