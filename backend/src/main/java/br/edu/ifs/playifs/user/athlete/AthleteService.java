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
import org.springframework.dao.DataIntegrityViolationException;
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

    private final AthleteRepository repository;
    private final RoleRepository roleRepository;
    private final PasswordEncoder passwordEncoder;
    private final TeamRepository teamRepository;

    public AthleteService(AthleteRepository repository, RoleRepository roleRepository, PasswordEncoder passwordEncoder, TeamRepository teamRepository) {
        this.repository = repository;
        this.roleRepository = roleRepository;
        this.passwordEncoder = passwordEncoder;
        this.teamRepository = teamRepository;
    }

    @Transactional(readOnly = true)
    public AthleteDetailsDTO findById(Long id) {
        Athlete entity = repository.findById(id).orElseThrow(
                () -> new ResourceNotFoundException("Atleta não encontrado com o ID: " + id));
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
        try {
            Athlete entity = createAthleteFromDTO(dto);
            entity = repository.save(entity);
            return new AthleteDetailsDTO(entity, false);
        }
        catch (DataIntegrityViolationException e) {
            throw new BusinessException("A matrícula informada já existe no sistema.");
        }
    }

    @Transactional
    public List<AthleteDetailsDTO> batchInsert(List<AthleteInputDTO> dtos) {
        try {
            List<Athlete> entities = dtos.stream()
                    .map(this::createAthleteFromDTO)
                    .collect(Collectors.toList());

            List<Athlete> savedEntities = repository.saveAll(entities);

            return savedEntities.stream()
                    .map(entity -> new AthleteDetailsDTO(entity, false))
                    .collect(Collectors.toList());
        }
        catch (DataIntegrityViolationException e) {
            throw new BusinessException("Uma ou mais matrículas informadas na lista já existem no sistema.");
        }
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
            boolean isCoach = isAthleteCoach(entity);
            return new AthleteDetailsDTO(entity, isCoach);
        } catch (EntityNotFoundException e) {
            throw new ResourceNotFoundException("Recurso não encontrado com o ID: " + id);
        }
        catch (DataIntegrityViolationException e) {
            throw new BusinessException("A matrícula informada já existe no sistema.");
        }
    }

    @Transactional
    public void delete(Long id) {
        Athlete athlete = repository.findById(id).orElseThrow(
                () -> new ResourceNotFoundException("Atleta não encontrado com o ID: " + id));

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

    @Transactional(readOnly = true)
    public boolean isAthleteCoach(Athlete athlete) {
        return !teamRepository.findByCoach(athlete).isEmpty();
    }

    public boolean isCurrentUser(Long athleteId, UserDetails loggedUser) {
        Athlete athlete = repository.findById(athleteId).orElse(null);
        return athlete != null && athlete.getUser().getUsername().equals(loggedUser.getUsername());
    }

    private Athlete createAthleteFromDTO(AthleteInputDTO dto) {
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

        return entity;
    }
}