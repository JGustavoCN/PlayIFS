package br.edu.ifs.playifs.team;

import br.edu.ifs.playifs.competition.CompetitionRepository;
import br.edu.ifs.playifs.competition.DesignatedCoachRepository;
import br.edu.ifs.playifs.competition.model.Competition;
import br.edu.ifs.playifs.data.course.CourseRepository;
import br.edu.ifs.playifs.data.course.model.Course;
import br.edu.ifs.playifs.data.sport.SportRepository;
import br.edu.ifs.playifs.data.sport.model.Sport;
import br.edu.ifs.playifs.team.dto.TeamDTO;
import br.edu.ifs.playifs.team.dto.TeamInsertDTO;
import br.edu.ifs.playifs.team.dto.TeamUpdateDTO;
import br.edu.ifs.playifs.shared.exceptions.BusinessException;
import br.edu.ifs.playifs.shared.exceptions.ResourceNotFoundException;
import br.edu.ifs.playifs.team.model.Team;
import br.edu.ifs.playifs.user.repository.AthleteRepository;
import br.edu.ifs.playifs.user.model.Athlete;
import br.edu.ifs.playifs.user.model.User;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class TeamService {

    @Autowired private TeamRepository repository;
    @Autowired private SportRepository sportRepository;
    @Autowired private CourseRepository courseRepository;
    @Autowired private CompetitionRepository competitionRepository;
    @Autowired private AthleteRepository athleteRepository;
    @Autowired private DesignatedCoachRepository designatedCoachRepository;

    @Transactional(readOnly = true)
    public TeamDTO findById(Long id) {
        Team entity = repository.findById(id).orElseThrow(
                () -> new ResourceNotFoundException("Equipa não encontrada com o ID: " + id));
        return new TeamDTO(entity);
    }

    @Transactional(readOnly = true)
    public Page<TeamDTO> findAll(Long competitionId, Long sportId, Long courseId, Pageable pageable) {

        Specification<Team> spec = Specification.anyOf(); // Inicia a especificação

        if (competitionId != null) {
            spec = spec.and(hasCompetition(competitionId));
        }
        if (sportId != null) {
            spec = spec.and(hasSport(sportId));
        }
        if (courseId != null) {
            spec = spec.and(hasCourse(courseId));
        }

        Page<Team> page = repository.findAll(spec, pageable);
        return page.map(TeamDTO::new);
    }

    // --- MÉTODOS AUXILIARES PARA OS FILTROS ---
    private static Specification<Team> hasCompetition(Long id) {
        return (root, query, cb) -> cb.equal(root.get("competition").get("id"), id);
    }

    private static Specification<Team> hasSport(Long id) {
        return (root, query, cb) -> cb.equal(root.get("sport").get("id"), id);
    }

    private static Specification<Team> hasCourse(Long id) {
        return (root, query, cb) -> cb.equal(root.get("course").get("id"), id);
    }
    @Transactional
    public TeamDTO insert(TeamInsertDTO dto, User loggedUser) {
        // Validação 1: O técnico da equipa deve ser o usuário logado
        Athlete loggedAthlete = athleteRepository.findByUser(loggedUser)
                .orElseThrow(() -> new BusinessException("Perfil de atleta não encontrado para o usuário logado."));

        if (!loggedAthlete.getId().equals(dto.getCoachId())) {
            throw new BusinessException("Acesso negado: você só pode criar uma equipa da qual você é o técnico.");
        }

        // Validação 2: Verificar se este atleta foi designado pelo coordenador
        if (!designatedCoachRepository.existsByCompetitionIdAndSportIdAndCourseIdAndCoachId(
                dto.getCompetitionId(), dto.getSportId(), dto.getCourseId(), dto.getCoachId())) {
            throw new BusinessException("Acesso negado: Este atleta não foi definido como técnico pelo coordenador para este esporte/curso.");
        }

        // Validação 3: Unicidade da equipe por esporte/curso
        if (repository.existsBySportIdAndCourseIdAndCompetitionId(dto.getSportId(), dto.getCourseId(), dto.getCompetitionId())) {
            throw new BusinessException("Já existe uma equipe deste curso para este esporte na competição.");
        }

        // Validação 4: Verificar se o técnico já está a jogar por outra equipa no mesmo desporto.
        if (athleteRepository.existsInAnotherTeamInCompetitionAndSport(dto.getCompetitionId(), dto.getSportId(), Collections.singletonList(dto.getCoachId()))) {
            throw new BusinessException("O atleta " + dto.getCoachId() + " não pode ser técnico, pois já está inscrito como jogador em outra equipa neste mesmo esporte.");
        }

        // Validação 5: Verificar se algum dos atletas da lista já é técnico de outra equipa no mesmo desporto.
        if (repository.anyOfTheseAthletesAreCoachesInCompetitionAndSport(dto.getCompetitionId(), dto.getSportId(), dto.getAthleteIds())) {
            throw new BusinessException("Um ou mais atletas da lista já são técnicos de outras equipas neste esporte e não podem ser inscritos como jogadores.");
        }

        // Validação 6: Verificar se algum dos atletas já está a jogar por outra equipa no mesmo desporto.
        if (athleteRepository.existsInAnotherTeamInCompetitionAndSport(dto.getCompetitionId(), dto.getSportId(), dto.getAthleteIds())) {
            throw new BusinessException("Um ou mais atletas da lista já estão inscritos como jogadores em outras equipas neste esporte.");
        }

        // Validação 7: Quantidade de atletas
        Sport sport = sportRepository.findById(dto.getSportId())
                .orElseThrow(() -> new BusinessException("Esporte não encontrado."));
        int numAthletes = dto.getAthleteIds().size();
        if (numAthletes < sport.getMinAthletes() || numAthletes > sport.getMaxAthletes()) {
            throw new BusinessException("Número de atletas (" + numAthletes + ") fora do permitido para o esporte: "
                    + sport.getName() + " (Mín: " + sport.getMinAthletes() + ", Máx: " + sport.getMaxAthletes() + ").");
        }

        Team entity = new Team();
        entity.setName(dto.getName());

        Course course = courseRepository.getReferenceById(dto.getCourseId());
        Competition competition = competitionRepository.getReferenceById(dto.getCompetitionId());
        Athlete coach = athleteRepository.getReferenceById(dto.getCoachId());

        entity.setCourse(course);
        entity.setSport(sport);
        entity.setCompetition(competition);
        entity.setCoach(coach);

        List<Athlete> athletes = dto.getAthleteIds().stream()
                .map(athleteId -> athleteRepository.getReferenceById(athleteId))
                .collect(Collectors.toList());
        entity.getAthletes().addAll(athletes);

        entity = repository.save(entity);
        return new TeamDTO(entity);
    }

    @Transactional
    public TeamDTO update(Long id, TeamUpdateDTO dto) {
        try {
            Team entity = repository.getReferenceById(id);
            entity.setName(dto.getName());
            entity = repository.save(entity);
            return new TeamDTO(entity);
        }
        catch (EntityNotFoundException e) {
            throw new ResourceNotFoundException("Recurso não encontrado com o ID: " + id);
        }
    }

    @Transactional
    public TeamDTO addAthletes(Long teamId, List<Long> athleteIds) {
        Team entity = repository.findById(teamId).orElseThrow(() -> new ResourceNotFoundException("Equipa não encontrada"));

        // Validação: Os novos atletas já jogam noutra equipa neste desporto?
        if (athleteRepository.existsInAnotherTeamInCompetitionAndSport(entity.getCompetition().getId(), entity.getSport().getId(), athleteIds)) {
            throw new BusinessException("Um ou mais atletas já estão inscritos em outra equipa neste desporto.");
        }

        List<Athlete> newAthletes = athleteRepository.findAllById(athleteIds);
        entity.getAthletes().addAll(newAthletes);

        // Validação: A equipa excedeu o número máximo de atletas?
        if (entity.getAthletes().size() > entity.getSport().getMaxAthletes()) {
            throw new BusinessException("A equipa excederia o número máximo de atletas para este desporto.");
        }

        entity = repository.save(entity);
        return new TeamDTO(entity);
    }

    @Transactional
    public void removeAthlete(Long teamId, Long athleteId) {
        Team entity = repository.findById(teamId).orElseThrow(() -> new ResourceNotFoundException("Equipa não encontrada"));

        // Validação: Não se pode remover o próprio técnico da lista de atletas.
        if (entity.getCoach().getId().equals(athleteId)) {
            throw new BusinessException("O técnico não pode ser removido da lista de atletas da equipa.");
        }

        entity.getAthletes().removeIf(athlete -> athlete.getId().equals(athleteId));

        // Validação: A equipa ficou abaixo do número mínimo?
        if (entity.getAthletes().size() < entity.getSport().getMinAthletes()) {
            throw new BusinessException("A equipa ficaria com menos que o número mínimo de atletas para este desporto.");
        }

        repository.save(entity);
    }

    @Transactional
    public void delete(Long id) {
        if (!repository.existsById(id)) {
            throw new ResourceNotFoundException("Recurso não encontrado com o ID: " + id);
        }

        Team team = repository.findById(id).get();
        // Validação: A equipa já tem jogos?
        if (!team.getGamesAsTeamA().isEmpty() || !team.getGamesAsTeamB().isEmpty()) {
            throw new BusinessException("Não é possível apagar uma equipa que já possui jogos agendados ou realizados.");
        }

        repository.deleteById(id);
    }

    // Método público para ser usado na anotação @PreAuthorize
    public boolean isCoachOfTeam(User user, Long teamId) {
        Athlete athlete = athleteRepository.findByUser(user).orElse(null);
        if (athlete == null) {
            return false;
        }
        Team team = repository.findById(teamId).orElse(null);
        return team != null && team.getCoach().getId().equals(athlete.getId());
    }
}
