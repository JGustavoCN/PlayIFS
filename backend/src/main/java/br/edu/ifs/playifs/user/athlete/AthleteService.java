package br.edu.ifs.playifs.user.athlete;

import br.edu.ifs.playifs.shared.web.dto.PageDTO;
import br.edu.ifs.playifs.team.TeamRepository;
import br.edu.ifs.playifs.user.dto.AthleteDetailsDTO;
import br.edu.ifs.playifs.user.dto.AthleteInputDTO;
import br.edu.ifs.playifs.user.dto.AthleteSummaryDTO;
import br.edu.ifs.playifs.user.dto.AthleteUpdateDTO;
import br.edu.ifs.playifs.user.model.Athlete;
import br.edu.ifs.playifs.user.model.Role;
import br.edu.ifs.playifs.user.model.User;
import br.edu.ifs.playifs.user.repository.AthleteRepository;
import br.edu.ifs.playifs.user.repository.RoleRepository;
import br.edu.ifs.playifs.shared.exceptions.BusinessException;
import br.edu.ifs.playifs.shared.exceptions.ResourceNotFoundException;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class AthleteService {

    @Autowired private AthleteRepository repository;
    @Autowired private RoleRepository roleRepository;
    @Autowired private PasswordEncoder passwordEncoder;
    @Autowired private TeamRepository teamRepository; // Injetar TeamRepository

    @Transactional(readOnly = true)
    public AthleteDetailsDTO findById(Long id) {
        Athlete entity = repository.findById(id).orElseThrow(
                () -> new ResourceNotFoundException("Atleta não encontrado com o ID: " + id));
        // Ao buscar por ID, também queremos saber se ele é técnico
        boolean isCoach = isAthleteCoach(entity);
        return new AthleteDetailsDTO(entity, isCoach);
    }

    @Transactional(readOnly = true)
    public PageDTO<AthleteSummaryDTO> findAll(String name, Pageable pageable) {
        Specification<Athlete> spec = AthleteSpecification.hasFullName(name);

        Page<Athlete> page = repository.findAll(spec, pageable);
        Page<AthleteSummaryDTO> pageDto = page.map(AthleteSummaryDTO::new);
        return new PageDTO<>(pageDto);
    }

    @Transactional
    public AthleteDetailsDTO insert(AthleteInputDTO dto) {
        User user = new User();
        user.setRegistration(dto.getRegistration());
        user.setPassword(passwordEncoder.encode(dto.getPassword()));

        Role athleteRole = roleRepository.findByAuthority("ROLE_ATHLETE");
        user.getRoles().add(athleteRole);

        Athlete entity = new Athlete();
        entity.setFullName(dto.getFullName());
        entity.setNickname(dto.getNickname());
        entity.setPhone(dto.getPhone());
        entity.setEmail(dto.getEmail());
        entity.setUser(user);

        entity = repository.save(entity);
        // Ao inserir, o atleta não será técnico de imediato
        return new AthleteDetailsDTO(entity, false);
    }

    @Transactional
    public List<AthleteDetailsDTO> batchInsert(List<AthleteInputDTO> dtos) {
        Role athleteRole = roleRepository.findByAuthority("ROLE_ATHLETE");

        List<Athlete> entities = dtos.stream().map(dto -> {
            User user = new User();
            user.setRegistration(dto.getRegistration());
            user.setPassword(passwordEncoder.encode(dto.getPassword()));
            user.getRoles().add(athleteRole);

            Athlete entity = new Athlete();
            entity.setFullName(dto.getFullName());
            entity.setNickname(dto.getNickname());
            entity.setPhone(dto.getPhone());
            entity.setEmail(dto.getEmail());
            entity.setUser(user);
            return entity;
        }).collect(Collectors.toList());

        List<Athlete> savedEntities = repository.saveAll(entities);

        return savedEntities.stream()
                .map(entity -> new AthleteDetailsDTO(entity, false)) // isCoach é false para novos atletas
                .collect(Collectors.toList());
    }

    @Transactional
    public AthleteDetailsDTO update(Long id, AthleteUpdateDTO dto) {
        try {
            Athlete entity = repository.getReferenceById(id);
            entity.setFullName(dto.getFullName());
            entity.setNickname(dto.getNickname());
            entity.setPhone(dto.getPhone());
            entity.setEmail(dto.getEmail());
            entity.getUser().setRegistration(dto.getRegistration());

            entity = repository.save(entity);
            // Ao atualizar, precisamos determinar se ele é técnico
            boolean isCoach = isAthleteCoach(entity);
            return new AthleteDetailsDTO(entity, isCoach);
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

    @Transactional
    public void batchDelete(List<Long> ids) {
        List<Athlete> athletesToDelete = repository.findAllById(ids);

        if (athletesToDelete.size() != ids.size()) {
            throw new ResourceNotFoundException("Um ou mais atletas não foram encontrados.");
        }

        for (Athlete athlete : athletesToDelete) {
            if (!athlete.getTeams().isEmpty()) {
                throw new BusinessException("Não é possível apagar o atleta '" + athlete.getFullName() + "' (ID: " + athlete.getId() + ") pois ele já está inscrito em uma ou mais equipas.");
            }
        }

        repository.deleteAllInBatch(athletesToDelete);
    }

    // Método auxiliar para verificar se um atleta é técnico de alguma equipe
    @Transactional(readOnly = true)
    public boolean isAthleteCoach(Athlete athlete) {
        // Verifica se o atleta é coach de *qualquer* equipe
        // teamRepository.findByCoach(athlete) retorna uma lista de equipes onde ele é coach
        return !teamRepository.findByCoach(athlete).isEmpty();
    }

    public boolean isCurrentUser(Long athleteId, UserDetails loggedUser) {
        Athlete athlete = repository.findById(athleteId).orElse(null);
        return athlete != null && athlete.getUser().getUsername().equals(loggedUser.getUsername());
    }
}