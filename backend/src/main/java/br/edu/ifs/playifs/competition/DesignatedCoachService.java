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
import br.edu.ifs.playifs.team.TeamRepository;
import br.edu.ifs.playifs.team.model.Team;
import br.edu.ifs.playifs.user.model.Athlete;
import br.edu.ifs.playifs.user.repository.AthleteRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Service
public class DesignatedCoachService {

    private final DesignatedCoachRepository repository;
    private final CompetitionRepository competitionRepository;
    private final SportRepository sportRepository;
    private final CourseRepository courseRepository;
    private final AthleteRepository athleteRepository;
    private final TeamRepository teamRepository;

    public DesignatedCoachService(DesignatedCoachRepository repository, CompetitionRepository competitionRepository, SportRepository sportRepository, CourseRepository courseRepository, AthleteRepository athleteRepository, TeamRepository teamRepository) {
        this.repository = repository;
        this.competitionRepository = competitionRepository;
        this.sportRepository = sportRepository;
        this.courseRepository = courseRepository;
        this.athleteRepository = athleteRepository;
        this.teamRepository = teamRepository;
    }


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
        Long competitionId = dto.getCompetitionId();
        Long sportId = dto.getSportId();
        Long courseId = dto.getCourseId();
        Long newCoachId = dto.getAthleteId();

        // 1. Encontra a designação existente para esta vaga.
        DesignatedCoach designatedCoach = repository
                .findByCompetitionIdAndSportIdAndCourseId(competitionId, sportId, courseId)
                .orElseThrow(() -> new ResourceNotFoundException("Nenhuma designação de técnico encontrada para esta vaga."));

        Athlete oldCoach = designatedCoach.getCoach();
        Athlete newCoach = athleteRepository.findById(newCoachId).orElseThrow(
                () -> new ResourceNotFoundException("Novo atleta técnico não encontrado com o ID: " + newCoachId));

        // 2. Validações para o NOVO técnico (reutilizando a lógica de 'defineCoach')
        if (athleteRepository.existsInAnotherTeamInCompetitionAndSport(competitionId, sportId, Collections.singletonList(newCoachId))) {
            throw new BusinessException("O novo técnico selecionado já está inscrito como jogador em outra equipa neste mesmo desporto e competição.");
        }
        if (repository.existsByCompetitionIdAndSportIdAndCoachId(competitionId, sportId, newCoachId)) {
            throw new BusinessException("O novo técnico selecionado já está definido como técnico em outra vaga neste mesmo desporto e competição.");
        }

        // 3. Atualiza a "Credencial": aponta a designação existente para o novo técnico.
        designatedCoach.setCoach(newCoach);
        repository.save(designatedCoach);

        // 4. Atualiza a "Função Ativa": encontra a equipa e substitui o técnico.
        // Usamos um Optional para o caso de o técnico antigo ainda não ter criado uma equipa.
        Optional<Team> teamOptional = teamRepository.findByCompetitionIdAndSportIdAndCourseIdAndCoach(
                competitionId, sportId, courseId, oldCoach);

        if (teamOptional.isPresent()) {
            Team team = teamOptional.get();
            team.setCoach(newCoach);

            // Atualiza o elenco de atletas da equipa
            team.getAthletes().remove(oldCoach);
            team.getAthletes().add(newCoach);

            teamRepository.save(team);
        }

        return new DesignatedCoachDetailsDTO(designatedCoach);
    }

    @Transactional
    public void removeCoach(Long competitionId, Long sportId, Long courseId) {
        DesignatedCoach designatedCoach = repository
                .findByCompetitionIdAndSportIdAndCourseId(competitionId, sportId, courseId)
                .orElseThrow(() -> new ResourceNotFoundException("Nenhum técnico encontrado para esta combinação."));

        // VALIDAÇÃO CRUCIAL: Verifica se algum técnico está a usar esta designação
        boolean isCoachInUse = teamRepository.existsByCompetitionIdAndSportIdAndCourseIdAndCoach(
                competitionId,
                sportId,
                courseId,
                designatedCoach.getCoach()
        );

        if (isCoachInUse) {
            throw new BusinessException("Não é possível remover a designação: este técnico está atualmente a liderar uma equipa. Por favor, substitua o técnico na equipa primeiro.");
        }

        repository.deleteById(designatedCoach.getId());
    }

    @Transactional
    public void batchRemove(List<Long> ids) {
        if (ids == null || ids.isEmpty()) {
            return;
        }

        // VALIDAÇÃO PARA A OPERAÇÃO EM MASSA
        List<DesignatedCoach> coachesToRemove = repository.findAllById(ids);
        for (DesignatedCoach dc : coachesToRemove) {
            boolean isCoachInUse = teamRepository.existsByCompetitionIdAndSportIdAndCourseIdAndCoach(
                    dc.getCompetition().getId(), dc.getSport().getId(), dc.getCourse().getId(), dc.getCoach());
            if (isCoachInUse) {
                throw new BusinessException("Não é possível remover a designação do técnico '" + dc.getCoach().getFullName() + "' pois ele está a liderar uma equipa.");
            }
        }

        repository.deleteAllByIdInBatch(ids);
    }

}