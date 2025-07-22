package br.edu.ifs.playifs.services;

import br.edu.ifs.playifs.dto.DesignatedCoachDTO;
import br.edu.ifs.playifs.entities.*;
import br.edu.ifs.playifs.repositories.*;
import br.edu.ifs.playifs.services.exceptions.BusinessException;
import br.edu.ifs.playifs.services.exceptions.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;

@Service
public class DesignatedCoachService {

    @Autowired private DesignatedCoachRepository repository;
    @Autowired private CompetitionRepository competitionRepository;
    @Autowired private SportRepository sportRepository;
    @Autowired private CourseRepository courseRepository;
    @Autowired private AthleteRepository athleteRepository;

    @Transactional(readOnly = true)
    public DesignatedCoachDTO findById(Long id) {
        DesignatedCoach entity = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Designação de técnico não encontrada com o ID: " + id));
        return new DesignatedCoachDTO(entity);
    }

    @Transactional(readOnly = true)
    public Page<DesignatedCoachDTO> findAll(Long competitionId, Long sportId, Long courseId, Pageable pageable) {
        Specification<DesignatedCoach> spec = Specification.anyOf();
        if (competitionId != null) {
            spec = spec.and((root, query, cb) -> cb.equal(root.get("competition").get("id"), competitionId));
        }
        if (sportId != null) {
            spec = spec.and((root, query, cb) -> cb.equal(root.get("sport").get("id"), sportId));
        }
        if (courseId != null) {
            spec = spec.and((root, query, cb) -> cb.equal(root.get("course").get("id"), courseId));
        }

        Page<DesignatedCoach> page = repository.findAll(spec, pageable);
        return page.map(DesignatedCoachDTO::new);
    }

    @Transactional
    public DesignatedCoachDTO defineCoach(DesignatedCoachDTO dto) {
        Long competitionId = dto.getCompetitionId();
        Long sportId = dto.getSportId();
        Long courseId = dto.getCourseId();
        Long athleteId = dto.getAthleteId();

        if (repository.existsByCompetitionIdAndSportIdAndCourseId(competitionId, sportId, courseId)) {
            throw new BusinessException("Já existe um técnico definido para este esporte e curso nesta competição.");
        }
        if (athleteRepository.existsInAnotherTeamInCompetitionAndSport(competitionId, sportId, Collections.singletonList(athleteId))) {
            throw new BusinessException("Este atleta está inscrito como jogador em outra equipe neste mesmo esporte e competição.");
        }
        if (repository.existsByCompetitionIdAndSportIdAndCoachId(competitionId, sportId, athleteId)) {
            throw new BusinessException("Este atleta já está definido como técnico em outra vaga (curso) neste mesmo esporte e competição.");
        }

        Competition competition = competitionRepository.findById(competitionId).orElseThrow(() -> new ResourceNotFoundException("Competição não encontrada."));
        Sport sport = sportRepository.findById(sportId).orElseThrow(() -> new ResourceNotFoundException("Esporte não encontrado."));
        Course course = courseRepository.findById(courseId).orElseThrow(() -> new ResourceNotFoundException("Curso não encontrado."));
        Athlete coach = athleteRepository.findById(athleteId).orElseThrow(() -> new ResourceNotFoundException("Atleta não encontrado."));

        DesignatedCoach entity = new DesignatedCoach(null, competition, sport, course, coach);
        entity = repository.save(entity);
        return new DesignatedCoachDTO(entity);
    }

    @Transactional
    public DesignatedCoachDTO updateCoach(DesignatedCoachDTO dto) {
        repository.deleteByCompetitionIdAndSportIdAndCourseId(dto.getCompetitionId(), dto.getSportId(), dto.getCourseId());
        return defineCoach(dto);
    }

    @Transactional
    public void removeCoach(Long competitionId, Long sportId, Long courseId) {
        if (!repository.existsByCompetitionIdAndSportIdAndCourseId(competitionId, sportId, courseId)) {
            throw new ResourceNotFoundException("Nenhum técnico encontrado para esta combinação de esporte e curso.");
        }
        repository.deleteByCompetitionIdAndSportIdAndCourseId(competitionId, sportId, courseId);
    }
}