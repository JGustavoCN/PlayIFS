package br.edu.ifs.playifs.services;

import br.edu.ifs.playifs.dto.CoordinatorDTO;
import br.edu.ifs.playifs.dto.CoordinatorInsertDTO;
import br.edu.ifs.playifs.entities.Coordinator;
import br.edu.ifs.playifs.entities.Role;
import br.edu.ifs.playifs.entities.User;
import br.edu.ifs.playifs.repositories.CoordinatorRepository;
import br.edu.ifs.playifs.repositories.RoleRepository;
import br.edu.ifs.playifs.services.exceptions.DatabaseException;
import br.edu.ifs.playifs.services.exceptions.ResourceNotFoundException;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class CoordinatorService {

    @Autowired private CoordinatorRepository repository;
    @Autowired private RoleRepository roleRepository;
    @Autowired private PasswordEncoder passwordEncoder;

    @Transactional(readOnly = true)
    public List<CoordinatorDTO> findAll() {
        List<Coordinator> list = repository.findAll();
        return list.stream().map(CoordinatorDTO::new).collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public CoordinatorDTO findById(Long id) {
        Coordinator entity = repository.findById(id).orElseThrow(
                () -> new ResourceNotFoundException("Recurso não encontrado"));
        return new CoordinatorDTO(entity);
    }

    @Transactional
    public CoordinatorDTO insert(CoordinatorInsertDTO dto) {
        User user = new User();
        user.setRegistration(dto.getRegistration());
        user.setPassword(passwordEncoder.encode(dto.getPassword()));

        Role coordinatorRole = roleRepository.findByAuthority("COORDINATOR");
        user.getRoles().add(coordinatorRole);

        Coordinator entity = new Coordinator();
        entity.setName(dto.getName());
        entity.setEmail(dto.getEmail());
        entity.setUser(user);

        entity = repository.save(entity);
        return new CoordinatorDTO(entity);
    }

    @Transactional
    public CoordinatorDTO update(Long id, CoordinatorDTO dto) {
        try {
            Coordinator entity = repository.getReferenceById(id);
            copyDtoToEntity(dto, entity);
            entity = repository.save(entity);
            return new CoordinatorDTO(entity);
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

    private void copyDtoToEntity(CoordinatorDTO dto, Coordinator entity) {
        entity.setName(dto.getName());
        entity.getUser().setRegistration(dto.getRegistration());
        entity.setEmail(dto.getEmail());
    }
}
