package br.edu.ifs.playifs.competition;

import br.edu.ifs.playifs.competition.dto.DesignatedCoachDetailsDTO;
import br.edu.ifs.playifs.competition.dto.DesignatedCoachInputDTO;
import br.edu.ifs.playifs.competition.dto.DesignatedCoachSummaryDTO;
import br.edu.ifs.playifs.competition.model.Competition;
import br.edu.ifs.playifs.competition.model.DesignatedCoach;
import br.edu.ifs.playifs.data.course.CourseRepository;
import br.edu.ifs.playifs.data.course.model.Course;
import br.edu.ifs.playifs.data.sport.SportRepository;
import br.edu.ifs.playifs.data.sport.model.Sport;
import br.edu.ifs.playifs.shared.exceptions.BusinessException;
import br.edu.ifs.playifs.shared.exceptions.ResourceNotFoundException;
import br.edu.ifs.playifs.shared.web.dto.PageDTO;
import br.edu.ifs.playifs.user.model.Athlete;
import br.edu.ifs.playifs.user.repository.AthleteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
public class DesignatedCoachService {

    @Autowired private DesignatedCoachRepository repository;
    @Autowired private CompetitionRepository competitionRepository;
    @Autowired private SportRepository sportRepository;
    @Autowired private CourseRepository courseRepository;
    @Autowired private AthleteRepository athleteRepository;

    @Transactional(readOnly = true)
    public DesignatedCoachDetailsDTO findById(Long id) {
        DesignatedCoach entity = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Designação de técnico não encontrada com o ID: " + id));
        return new DesignatedCoachDetailsDTO(entity);
    }

    @Transactional(readOnly = true)
    public PageDTO<DesignatedCoachSummaryDTO> findAll(Long competitionId, Long sportId, Long courseId, String athleteName, Pageable pageable) {
        Specification<DesignatedCoach> spec = DesignatedCoachSpecification.inCompetition(competitionId)
                .and(DesignatedCoachSpecification.ofSport(sportId))
                .and(DesignatedCoachSpecification.fromCourse(courseId))
                .and(DesignatedCoachSpecification.withAthleteName(athleteName));

        Page<DesignatedCoach> page = repository.findAll(spec, pageable);
        Page<DesignatedCoachSummaryDTO> pageDto = page.map(DesignatedCoachSummaryDTO::new);
        return new PageDTO<>(pageDto);
    }

    @Transactional
    public DesignatedCoachDetailsDTO defineCoach(DesignatedCoachInputDTO dto) {
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
        return new DesignatedCoachDetailsDTO(entity);
    }

    @Transactional
    public List<DesignatedCoachDetailsDTO> batchUpsert(List<DesignatedCoachInputDTO> dtos) {
        List<DesignatedCoachDetailsDTO> resultList = new ArrayList<>();

        for (DesignatedCoachInputDTO dto : dtos) {
            // A lógica de "updateCoach" já contém um "delete" seguido de um "define",
            // funcionando perfeitamente como um "upsert".
            resultList.add(updateCoach(dto));
        }

        return resultList;
    }

    @Transactional
    public DesignatedCoachDetailsDTO updateCoach(DesignatedCoachInputDTO dto) {
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

    @Transactional
    public void batchRemove(List<Long> ids) {
        if (ids == null || ids.isEmpty()) {
            return; // Nenhuma ação a ser feita
        }
        // O Spring Data JPA executará isso em uma única operação de deleção otimizada
        repository.deleteAllByIdInBatch(ids);
    }

}