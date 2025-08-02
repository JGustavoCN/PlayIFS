package br.edu.ifs.playifs.data.campus;

import br.edu.ifs.playifs.data.campus.dto.CampusDetailsDTO;
import br.edu.ifs.playifs.data.campus.dto.CampusInputDTO;
import br.edu.ifs.playifs.data.campus.dto.CampusSummaryDTO;
import br.edu.ifs.playifs.data.campus.model.Campus;
import br.edu.ifs.playifs.shared.exceptions.BusinessException;
import br.edu.ifs.playifs.shared.exceptions.ResourceNotFoundException;
import br.edu.ifs.playifs.shared.web.dto.PageDTO;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class CampusService {

    @Autowired
    private CampusRepository repository;

    @Transactional(readOnly = true)
    public PageDTO<CampusSummaryDTO> findAll(String name, Pageable pageable) {
        Specification<Campus> spec = CampusSpecification.hasName(name);
        Page<Campus> page = repository.findAll(spec, pageable);
        Page<CampusSummaryDTO> pageDto = page.map(CampusSummaryDTO::new);
        return new PageDTO<>(pageDto);
    }

    @Transactional(readOnly = true)
    public CampusDetailsDTO findById(Long id) {
        Campus entity = repository.findById(id).orElseThrow(
                () -> new ResourceNotFoundException("Campus não encontrado com o ID: " + id));
        return new CampusDetailsDTO(entity);
    }

    @Transactional
    public CampusDetailsDTO insert(CampusInputDTO dto) {
        Campus entity = new Campus();
        entity.setName(dto.getName());
        entity = repository.save(entity);
        return new CampusDetailsDTO(entity);
    }

    @Transactional
    public List<CampusDetailsDTO> batchInsert(List<CampusInputDTO> dtos) {
        List<Campus> entities = dtos.stream().map(dto -> {
            Campus entity = new Campus();
            entity.setName(dto.getName());
            return entity;
        }).collect(Collectors.toList());

        List<Campus> savedEntities = repository.saveAll(entities);

        return savedEntities.stream()
                .map(CampusDetailsDTO::new)
                .collect(Collectors.toList());
    }

    @Transactional
    public CampusDetailsDTO update(Long id, CampusInputDTO dto) {
        try {
            Campus entity = repository.getReferenceById(id);
            entity.setName(dto.getName());
            entity = repository.save(entity);
            return new CampusDetailsDTO(entity);
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

    @Transactional
    public void batchDelete(List<Long> ids) {
        // Busca todos os campi de uma vez para validar
        List<Campus> campusesToDelete = repository.findAllById(ids);

        if (campusesToDelete.size() != ids.size()) {
            throw new ResourceNotFoundException("Um ou mais campi não foram encontrados.");
        }

        // Validação de negócio: verifica se algum campus possui cursos associados
        for (Campus campus : campusesToDelete) {
            if (!campus.getCourses().isEmpty()) {
                throw new BusinessException("Não é possível apagar o campus '" + campus.getName() + "' (ID: " + campus.getId() + ") pois ele já possui cursos associados.");
            }
        }

        repository.deleteAllInBatch(campusesToDelete);
    }

}