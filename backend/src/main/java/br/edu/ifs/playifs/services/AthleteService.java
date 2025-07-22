package br.edu.ifs.playifs.services;

import br.edu.ifs.playifs.dto.AthleteDTO;
import br.edu.ifs.playifs.dto.AthleteInsertDTO;
import br.edu.ifs.playifs.entities.Athlete;
import br.edu.ifs.playifs.entities.Role;
import br.edu.ifs.playifs.entities.User;
import br.edu.ifs.playifs.repositories.AthleteRepository;
import br.edu.ifs.playifs.repositories.RoleRepository;
import br.edu.ifs.playifs.services.exceptions.BusinessException;
import br.edu.ifs.playifs.services.exceptions.ResourceNotFoundException;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AthleteService {

    @Autowired private AthleteRepository repository;
    @Autowired private RoleRepository roleRepository;
    @Autowired private PasswordEncoder passwordEncoder;

    @Transactional(readOnly = true)
    public AthleteDTO findById(Long id) {
        Athlete entity = repository.findById(id).orElseThrow(
                () -> new ResourceNotFoundException("Atleta não encontrado com o ID: " + id));
        return new AthleteDTO(entity);
    }

    @Transactional(readOnly = true)
    public Page<AthleteDTO> findAll(String name, Pageable pageable) {
        Page<Athlete> page = repository.findByFullNameContainingIgnoreCase(name, pageable);
        return page.map(AthleteDTO::new);
    }

    @Transactional
    public AthleteDTO insert(AthleteInsertDTO dto) {
        User user = new User();
        user.setRegistration(dto.getRegistration());
        user.setPassword(passwordEncoder.encode(dto.getPassword()));

        Role athleteRole = roleRepository.findByAuthority("ROLE_ATHLETE");
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
            entity.setFullName(dto.getFullName());
            entity.setNickname(dto.getNickname());
            entity.setPhone(dto.getPhone());
            entity.setEmail(dto.getEmail());
            entity.getUser().setRegistration(dto.getRegistration());

            entity = repository.save(entity);
            return new AthleteDTO(entity);
        } catch (EntityNotFoundException e) {
            throw new ResourceNotFoundException("Recurso não encontrado com o ID: " + id);
        }
    }

    @Transactional
    public void delete(Long id) {
        if (!repository.existsById(id)) {
            throw new ResourceNotFoundException("Recurso não encontrado com o ID: " + id);
        }
        Athlete athlete = repository.findById(id).get();
        if (!athlete.getTeams().isEmpty()) {
            throw new BusinessException("Não é possível apagar um atleta que já está inscrito em uma ou mais equipas.");
        }
        repository.deleteById(id);
    }

    private void copyDtoToEntity(AthleteInsertDTO dto, Athlete entity) {
        entity.setFullName(dto.getFullName());
        entity.setNickname(dto.getNickname());
        entity.setPhone(dto.getPhone());
        entity.setEmail(dto.getEmail());
    }
}