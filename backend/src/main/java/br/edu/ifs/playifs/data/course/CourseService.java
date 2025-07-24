package br.edu.ifs.playifs.data.course;

import br.edu.ifs.playifs.data.course.dto.CourseDTO;
import br.edu.ifs.playifs.data.campus.model.Campus;
import br.edu.ifs.playifs.data.course.model.Course;
import br.edu.ifs.playifs.data.campus.CampusRepository;
import br.edu.ifs.playifs.shared.exceptions.BusinessException;
import br.edu.ifs.playifs.shared.exceptions.ResourceNotFoundException;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CourseService {

    @Autowired
    private CourseRepository repository;
    @Autowired
    private CampusRepository campusRepository;

    @Transactional(readOnly = true)
    public CourseDTO findById(Long id) {
        Course entity = repository.findById(id).orElseThrow(
                () -> new ResourceNotFoundException("Curso não encontrado com o ID: " + id));
        return new CourseDTO(entity);
    }

    @Transactional(readOnly = true)
    public Page<CourseDTO> findAll(String name, Long campusId, Pageable pageable) {
        Page<Course> page = repository.find(name, campusId, pageable);
        return page.map(CourseDTO::new);
    }

    @Transactional
    public CourseDTO insert(CourseDTO dto) {
        Course entity = new Course();
        copyDtoToEntity(dto, entity);
        entity = repository.save(entity);
        return new CourseDTO(entity);
    }

    @Transactional
    public CourseDTO update(Long id, CourseDTO dto) {
        try {
            Course entity = repository.getReferenceById(id);
            copyDtoToEntity(dto, entity);
            entity = repository.save(entity);
            return new CourseDTO(entity);
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

    private void copyDtoToEntity(CourseDTO dto, Course entity) {
        entity.setName(dto.getName());
        entity.setLevel(dto.getLevel());
        Campus campus = campusRepository.getReferenceById(dto.getCampus().getId());
        entity.setCampus(campus);
    }
}