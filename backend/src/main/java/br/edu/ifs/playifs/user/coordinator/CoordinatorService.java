package br.edu.ifs.playifs.user.coordinator;

import br.edu.ifs.playifs.shared.web.dto.PageDTO;
import br.edu.ifs.playifs.user.dto.CoordinatorDetailsDTO; // Importação alterada
import br.edu.ifs.playifs.user.dto.CoordinatorSummaryDTO; // Nova importação
import br.edu.ifs.playifs.user.dto.CoordinatorInputDTO;
import br.edu.ifs.playifs.user.dto.CoordinatorUpdateDTO; // Nova importação
import br.edu.ifs.playifs.user.model.Coordinator;
import br.edu.ifs.playifs.user.model.Role;
import br.edu.ifs.playifs.user.model.User;
import br.edu.ifs.playifs.user.repository.CoordinatorRepository;
import br.edu.ifs.playifs.user.repository.RoleRepository;
import br.edu.ifs.playifs.shared.exceptions.BusinessException;
import br.edu.ifs.playifs.shared.exceptions.ResourceNotFoundException;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CoordinatorService {

    @Autowired private CoordinatorRepository repository;
    @Autowired private RoleRepository roleRepository;
    @Autowired private PasswordEncoder passwordEncoder;

    @Transactional(readOnly = true)
    public CoordinatorDetailsDTO findById(Long id) { // Tipo de retorno alterado
        Coordinator entity = repository.findById(id).orElseThrow(
                () -> new ResourceNotFoundException("Coordenador não encontrado com o ID: " + id));
        return new CoordinatorDetailsDTO(entity);
    }

    @Transactional(readOnly = true)
    public PageDTO<CoordinatorSummaryDTO> findAll(String name, Pageable pageable) { // Tipo de retorno alterado
        Page<Coordinator> page = repository.findByNameContainingIgnoreCase(name, pageable);
        Page<CoordinatorSummaryDTO> pageDto = page.map(CoordinatorSummaryDTO::new);
        return new PageDTO<>(pageDto);
    }

    @Transactional
    public CoordinatorDetailsDTO insert(CoordinatorInputDTO dto) { // Tipo de retorno alterado
        User user = new User();
        user.setRegistration(dto.getRegistration());
        user.setPassword(passwordEncoder.encode(dto.getPassword()));

        Role coordinatorRole = roleRepository.findByAuthority("ROLE_COORDINATOR");
        user.getRoles().add(coordinatorRole);

        Coordinator entity = new Coordinator();
        // Mapeamento direto de campos de CoordinatorInsertDTO para a entidade
        entity.setName(dto.getName());
        entity.setEmail(dto.getEmail());
        entity.setUser(user);

        entity = repository.save(entity);
        return new CoordinatorDetailsDTO(entity);
    }

    @Transactional
    public CoordinatorDetailsDTO update(Long id, CoordinatorUpdateDTO dto) { // Parâmetro e tipo de retorno alterados
        try {
            Coordinator entity = repository.getReferenceById(id);
            // Atualiza os campos do CoordinatorUpdateDTO
            entity.setName(dto.getName());
            entity.setEmail(dto.getEmail());
            entity.getUser().setRegistration(dto.getRegistration()); // Atualiza a matrícula do usuário associado
            entity = repository.save(entity);
            return new CoordinatorDetailsDTO(entity);
        } catch (EntityNotFoundException e) {
            throw new ResourceNotFoundException("Recurso não encontrado com o ID: " + id);
        }
    }

    @Transactional
    public void delete(Long id, User loggedUser) {
        if (!repository.existsById(id)) {
            throw new ResourceNotFoundException("Recurso não encontrado com o ID: " + id);
        }

        Coordinator coordinatorToDelete = repository.findById(id).get();
        if (coordinatorToDelete.getUser().getId().equals(loggedUser.getId())) {
            throw new BusinessException("Ação não permitida: um coordenador não pode apagar a sua própria conta.");
        }

        repository.deleteById(id);
    }
}