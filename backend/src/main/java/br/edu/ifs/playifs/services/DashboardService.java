package br.edu.ifs.playifs.services;

import br.edu.ifs.playifs.dto.*;
import br.edu.ifs.playifs.dto.dashboard.*;
import br.edu.ifs.playifs.entities.Athlete;
import br.edu.ifs.playifs.entities.Competition;
import br.edu.ifs.playifs.entities.Game;
import br.edu.ifs.playifs.entities.Team;
import br.edu.ifs.playifs.entities.User;
import br.edu.ifs.playifs.entities.enums.GameStatus;
import br.edu.ifs.playifs.repositories.*;
import br.edu.ifs.playifs.services.exceptions.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class DashboardService {

    @Autowired private AthleteRepository athleteRepository;
    @Autowired private GameRepository gameRepository;
    @Autowired private CompetitionRepository competitionRepository;
    @Autowired private TeamRepository teamRepository;

    @Transactional(readOnly = true)
    public AthleteDashboardDTO getAthleteDashboard(UserDetails userDetails) {
        // 1. Identificar o atleta logado
        Athlete athlete = athleteRepository.findByUser((User) userDetails)
                .orElseThrow(() -> new ResourceNotFoundException("Atleta não encontrado"));

        // 2. Buscar todas as equipas em que o atleta está inscrito
        List<Team> teams = new ArrayList<>(athlete.getTeams());

        // 3. Agrupar as equipas por competição
        Map<Competition, List<Team>> participationsByCompetition = teams.stream()
                .collect(Collectors.groupingBy(Team::getCompetition));

        // 4. Montar a lista de DTOs de participação
        List<CompetitionParticipationDTO> participationDTOs = new ArrayList<>();

        for (Map.Entry<Competition, List<Team>> entry : participationsByCompetition.entrySet()) {
            Competition competition = entry.getKey();
            List<Team> teamsInCompetition = entry.getValue();

            List<SportParticipationDTO> sportDTOs = teamsInCompetition.stream().map(team -> {
                // Para cada equipa, buscar o seu próximo jogo
                Game nextGame = gameRepository
                        .findTop1ByTeamAOrTeamBAndStatusOrderByDateTimeAsc(team, team, GameStatus.SCHEDULED)
                        .orElse(null);

                return new SportParticipationDTO(team, athlete, nextGame);
            }).collect(Collectors.toList());

            participationDTOs.add(new CompetitionParticipationDTO(competition.getId(), competition.getName(), sportDTOs));
        }

        // 5. Montar e retornar o DTO final do dashboard
        return new AthleteDashboardDTO(athlete, participationDTOs);
    }

    @Transactional(readOnly = true)
    public CoordinatorDashboardDTO getCoordinatorDashboard() {
        long competitionCount = competitionRepository.count();
        long teamCount = teamRepository.count();
        long athleteCount = athleteRepository.count();
        long pendingGamesCount = gameRepository.countByStatusAndDateTimeBefore(GameStatus.SCHEDULED, Instant.now());
        DashboardStatsDTO stats = new DashboardStatsDTO(competitionCount, teamCount, athleteCount, pendingGamesCount);

        List<Game> upcomingGames = gameRepository.findTop5ByStatusOrderByDateTimeAsc(GameStatus.SCHEDULED);
        List<UpcomingGameDTO> upcomingGamesDTO = upcomingGames.stream().map(UpcomingGameDTO::new).collect(Collectors.toList());

        return new CoordinatorDashboardDTO(stats, upcomingGamesDTO);
    }
}