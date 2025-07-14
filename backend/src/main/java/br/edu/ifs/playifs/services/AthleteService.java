package br.edu.ifs.playifs.services;

import br.edu.ifs.playifs.dto.AthleteDTO;
import br.edu.ifs.playifs.dto.AthleteInsertDTO;
import br.edu.ifs.playifs.entities.Athlete;
import br.edu.ifs.playifs.entities.Role;
import br.edu.ifs.playifs.entities.User;
import br.edu.ifs.playifs.repositories.AthleteRepository;
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
public class AthleteService {

    @Autowired private AthleteRepository repository;
    @Autowired private RoleRepository roleRepository;
    @Autowired private PasswordEncoder passwordEncoder;

    @Transactional(readOnly = true)
    public AthleteDTO findById(Long id) {
        Athlete athlete = repository.findById(id).orElseThrow(
                () -> new ResourceNotFoundException("Recurso não encontrado"));
        return new AthleteDTO(athlete);
    }

    @Transactional(readOnly = true)
    public List<AthleteDTO> findAll() {
        List<Athlete> list = repository.findAll();
        return list.stream().map(AthleteDTO::new).collect(Collectors.toList());
    }

    @Transactional
    public AthleteDTO insert(AthleteInsertDTO dto) {
        User user = new User();
        user.setRegistration(dto.getRegistration());
        user.setPassword(passwordEncoder.encode(dto.getPassword()));

        // Supondo que ID 1 = ROLE_ATHLETE, conforme nosso seeder
        Role athleteRole = roleRepository.getReferenceById(1L);
        user.getRoles().add(athleteRole);

        Athlete entity = new Athlete();
        copyDtoToEntity(dto, entity);
        entity.setUser(user);

        entity = repository.save(entity);
        return new AthleteDTO(entity);
    }

    @Transactional
    public AthleteDTO update(Long id, AthleteDTO dto) {
        try {
            Athlete entity = repository.getReferenceById(id);
            // Atualiza os dados do perfil do Atleta
            entity.setFullName(dto.getFullName());
            entity.setNickname(dto.getNickname());
            entity.setPhone(dto.getPhone());
            entity.setEmail(dto.getEmail());
            // Atualiza os dados de login no User associado
            entity.getUser().setRegistration(dto.getRegistration());

            entity = repository.save(entity);
            return new AthleteDTO(entity);
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

    private void copyDtoToEntity(AthleteInsertDTO dto, Athlete entity) {
        entity.setFullName(dto.getFullName());
        entity.setNickname(dto.getNickname());
        entity.setPhone(dto.getPhone());
        entity.setEmail(dto.getEmail());
    }
}