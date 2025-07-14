package br.edu.ifs.playifs.services;

import br.edu.ifs.playifs.dto.TeamDTO;
import br.edu.ifs.playifs.dto.TeamInsertDTO;
import br.edu.ifs.playifs.entities.*;
import br.edu.ifs.playifs.repositories.*;
import br.edu.ifs.playifs.services.exceptions.BusinessException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class TeamService {

    @Autowired private TeamRepository repository;
    @Autowired private SportRepository sportRepository;
    @Autowired private CourseRepository courseRepository;
    @Autowired private CompetitionRepository competitionRepository; // Injetar
    @Autowired private AthleteRepository athleteRepository;
    @Autowired private DesignatedCoachRepository designatedCoachRepository;

    @Transactional
    public TeamDTO insert(TeamInsertDTO dto, User loggedUser) {
        // --- INÍCIO DA NOVA VALIDAÇÃO ---
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
        // --- FIM DA NOVA VALIDAÇÃO ---

        // Validação 3: Unicidade da equipe (lógica existente)
        if (repository.existsBySportIdAndCourseIdAndCompetitionId(dto.getSportId(), dto.getCourseId(), dto.getCompetitionId())) {
            throw new BusinessException("Já existe uma equipe deste curso para este esporte na competição.");
        }

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
}
