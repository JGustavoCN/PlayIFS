package br.edu.ifs.playifs.services;

import br.edu.ifs.playifs.dto.CourseDTO;
import br.edu.ifs.playifs.entities.Campus;
import br.edu.ifs.playifs.entities.Course;
import br.edu.ifs.playifs.repositories.CampusRepository;
import br.edu.ifs.playifs.repositories.CourseRepository;
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
public class CourseService {

    @Autowired
    private CourseRepository repository;

    @Autowired
    private CampusRepository campusRepository; // Injetamos o repositório de Campus

    @Transactional(readOnly = true)
    public CourseDTO findById(Long id) {
        Course course = repository.findById(id).orElseThrow(
                () -> new ResourceNotFoundException("Recurso não encontrado"));
        return new CourseDTO(course);
    }

    @Transactional(readOnly = true)
    public List<CourseDTO> findAll() {
        List<Course> list = repository.findAll();
        return list.stream().map(CourseDTO::new).collect(Collectors.toList());
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

    // Método auxiliar para copiar os dados do DTO para a entidade
    private void copyDtoToEntity(CourseDTO dto, Course entity) {
        entity.setName(dto.getName());
        entity.setLevel(dto.getLevel());

        // Busca a entidade Campus pelo ID fornecido no DTO e a associa ao curso
        Campus campus = campusRepository.getReferenceById(dto.getCampus().getId());
        entity.setCampus(campus);
    }
}