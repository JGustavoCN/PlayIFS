package br.edu.ifs.playifs.data.campus;

import br.edu.ifs.playifs.data.campus.dto.CampusDTO;
import br.edu.ifs.playifs.data.campus.model.Campus;
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
public class CampusService {

    @Autowired
    private CampusRepository repository;

    @Transactional(readOnly = true)
    public CampusDTO findById(Long id) {
        Campus entity = repository.findById(id).orElseThrow(
                () -> new ResourceNotFoundException("Campus não encontrado com o ID: " + id));
        return new CampusDTO(entity);
    }

    @Transactional(readOnly = true)
    public PageDTO<CampusDTO> findAll(String name, Pageable pageable) {
        Page<Campus> page = repository.findByNameContainingIgnoreCase(name, pageable);
        Page<CampusDTO> pageDto = page.map(CampusDTO::new);
        return new PageDTO<>(pageDto);
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
            throw new ResourceNotFoundException("Recurso não encontrado com o ID: " + id);
        }
    }

    @Transactional
    public void delete(Long id) {
        if (!repository.existsById(id)) {
            throw new ResourceNotFoundException("Recurso não encontrado com o ID: " + id);
        }
        Campus campus = repository.findById(id).get();
        if (!campus.getCourses().isEmpty()) {
            throw new BusinessException("Não é possível apagar um campus que já possui cursos associados.");
        }
        repository.deleteById(id);
    }
}