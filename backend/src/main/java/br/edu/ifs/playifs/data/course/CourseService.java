package br.edu.ifs.playifs.data.course;

import br.edu.ifs.playifs.data.campus.CampusRepository;
import br.edu.ifs.playifs.data.campus.model.Campus;
import br.edu.ifs.playifs.data.course.dto.CourseDetailsDTO;
import br.edu.ifs.playifs.data.course.dto.CourseInputDTO;
import br.edu.ifs.playifs.data.course.dto.CourseSummaryDTO;
import br.edu.ifs.playifs.data.course.model.Course;
import br.edu.ifs.playifs.data.course.model.enums.CourseLevel;
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
public class CourseService {

    @Autowired
    private CourseRepository repository;
    @Autowired
    private CampusRepository campusRepository;

    @Transactional(readOnly = true)
    public PageDTO<CourseSummaryDTO> findAll(String name, Long campusId, CourseLevel level, Pageable pageable) {

        Specification<Course> spec = CourseSpecification.hasName(name)
                .and(CourseSpecification.inCampus(campusId))
                .and(CourseSpecification.hasLevel(level));

        Page<Course> page = repository.findAll(spec, pageable);
        Page<CourseSummaryDTO> pageDto = page.map(CourseSummaryDTO::new);
        return new PageDTO<>(pageDto);
    }

    @Transactional(readOnly = true)
    public CourseDetailsDTO findById(Long id) {
        Course entity = repository.findById(id).orElseThrow(
                () -> new ResourceNotFoundException("Curso não encontrado com o ID: " + id));
        return new CourseDetailsDTO(entity);
    }

    @Transactional
    public CourseDetailsDTO insert(CourseInputDTO dto) {
        Course entity = new Course();
        copyDtoToEntity(dto, entity);
        entity = repository.save(entity);
        return new CourseDetailsDTO(entity);
    }

    @Transactional
    public List<CourseDetailsDTO> batchInsert(List<CourseInputDTO> dtos) {
        List<Course> entities = dtos.stream().map(dto -> {
            Course entity = new Course();
            // Reutiliza o método que já possui a lógica de mapeamento
            copyDtoToEntity(dto, entity);
            return entity;
        }).collect(Collectors.toList());

        List<Course> savedEntities = repository.saveAll(entities);

        return savedEntities.stream()
                .map(CourseDetailsDTO::new)
                .collect(Collectors.toList());
    }

    @Transactional
    public CourseDetailsDTO update(Long id, CourseInputDTO dto) {
        try {
            Course entity = repository.getReferenceById(id);
            copyDtoToEntity(dto, entity);
            entity = repository.save(entity);
            return new CourseDetailsDTO(entity);
        } catch (EntityNotFoundException e) {
            throw new ResourceNotFoundException("Recurso não encontrado com o ID: " + id);
        }
    }

    @Transactional
    public void delete(Long id) {
        if (!repository.existsById(id)) {
            throw new ResourceNotFoundException("Recurso não encontrado com o ID: " + id);
        }
        Course course = repository.findById(id).get();
        if (!course.getTeams().isEmpty()) {
            throw new BusinessException("Não é possível apagar um curso que já possui equipas inscritas.");
        }
        repository.deleteById(id);
    }

    @Transactional
    public void batchDelete(List<Long> ids) {
        List<Course> coursesToDelete = repository.findAllById(ids);

        if (coursesToDelete.size() != ids.size()) {
            throw new ResourceNotFoundException("Um ou mais cursos não foram encontrados.");
        }

        // Validação de negócio: verifica se algum curso possui equipes associadas
        for (Course course : coursesToDelete) {
            if (!course.getTeams().isEmpty()) {
                throw new BusinessException("Não é possível apagar o curso '" + course.getName() + "' (ID: " + course.getId() + ") pois ele já possui equipas inscritas.");
            }
        }

        repository.deleteAllInBatch(coursesToDelete);
    }

    private void copyDtoToEntity(CourseInputDTO dto, Course entity) {
        entity.setName(dto.getName());
        entity.setLevel(dto.getLevel());
        Campus campus = campusRepository.findById(dto.getCampusId())
                .orElseThrow(() -> new ResourceNotFoundException("Campus não encontrado com o ID: " + dto.getCampusId()));
        entity.setCampus(campus);
    }
}