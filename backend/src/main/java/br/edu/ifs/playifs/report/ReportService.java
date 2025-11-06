package br.edu.ifs.playifs.report;

import br.edu.ifs.playifs.competition.CompetitionRepository;
import br.edu.ifs.playifs.competition.GameGroupRepository;
import br.edu.ifs.playifs.competition.model.Competition;
import br.edu.ifs.playifs.competition.model.GameGroup;
import br.edu.ifs.playifs.data.sport.SportRepository;
import br.edu.ifs.playifs.data.sport.model.Sport;
import br.edu.ifs.playifs.game.model.enums.GamePhase;
import br.edu.ifs.playifs.game.model.enums.GameStatus;
import br.edu.ifs.playifs.game.GameRepository;
import br.edu.ifs.playifs.game.model.Game;
import br.edu.ifs.playifs.report.dto.*;
import br.edu.ifs.playifs.shared.exceptions.BusinessException;
import br.edu.ifs.playifs.shared.exceptions.ResourceNotFoundException;
import br.edu.ifs.playifs.shared.util.TeamStanding;
import br.edu.ifs.playifs.team.TeamRepository;
import br.edu.ifs.playifs.team.model.Team;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ReportService {

    private final GameGroupRepository gameGroupRepository;
    private final GameRepository gameRepository;
    private final CompetitionRepository competitionRepository;
    private final SportRepository sportRepository;
    private final TeamRepository teamRepository;

    public ReportService(GameGroupRepository gameGroupRepository, GameRepository gameRepository, CompetitionRepository competitionRepository, SportRepository sportRepository, TeamRepository teamRepository) {
        this.gameGroupRepository = gameGroupRepository;
        this.gameRepository = gameRepository;
        this.competitionRepository = competitionRepository;
        this.sportRepository = sportRepository;
        this.teamRepository = teamRepository;
    }

    @Transactional(readOnly = true)
    public WoSummaryReportDTO getWoSummary(Long competitionId) {
        List<Game> woGames = gameRepository.findAllByCompetitionAndStatus(competitionId, GameStatus.WO);
        List<WoGameInfoDTO> woGamesDto = woGames.stream()
                .map(WoGameInfoDTO::new)
                .collect(Collectors.toList());
        return new WoSummaryReportDTO(woGames.size(), woGamesDto);
    }

    @Transactional(readOnly = true)
    public SportStatisticsDTO getSportStatistics(Long competitionId, Long sportId) {
        long totalGames = gameRepository.countFinishedGamesByCompetitionAndSport(competitionId, sportId);
        if (totalGames == 0) {
            return new SportStatisticsDTO();
        }
        Long totalGoals = gameRepository.sumTotalGoalsByCompetitionAndSport(competitionId, sportId);
        totalGoals = (totalGoals == null) ? 0L : totalGoals;
        double averageGoals = (double) totalGoals / totalGames;
        List<Game> highestScoringGames = gameRepository.findHighestScoringGames(competitionId, sportId, PageRequest.of(0, 1));
        HighestScoringGameDTO highestScoringGameDto = !highestScoringGames.isEmpty()
                ? new HighestScoringGameDTO(highestScoringGames.getFirst())
                : null;
        SportStatisticsDTO stats = new SportStatisticsDTO();
        stats.setTotalGames(totalGames);
        stats.setTotalGoals(totalGoals);
        stats.setAverageGoalsPerGame(averageGoals);
        stats.setHighestScoringGame(highestScoringGameDto);
        return stats;
    }

    @Transactional(readOnly = true)
    public TeamCampaignDTO getTeamCampaign(Long teamId, Long competitionId) {
        Team team = teamRepository.findById(teamId)
                .orElseThrow(() -> new ResourceNotFoundException("Equipa não encontrada."));
        Competition competition = competitionRepository.findById(competitionId)
                .orElseThrow(() -> new ResourceNotFoundException("Competição não encontrada."));
        List<Game> allGames = gameRepository.findAllByTeamAndCompetition(teamId, competitionId);
        TeamCampaignDTO.GroupPhaseStats groupStats = new TeamCampaignDTO.GroupPhaseStats();
        allGames.stream()
                .filter(g -> g.getPhase() == GamePhase.GROUP_STAGE && g.getStatus() != GameStatus.SCHEDULED)
                .forEach(game -> {
                    boolean isTeamA = game.getTeamA().getId().equals(teamId);
                    int goalsFor = isTeamA ? game.getScoreTeamA() : game.getScoreTeamB();
                    int goalsAgainst = isTeamA ? game.getScoreTeamB() : game.getScoreTeamA();
                    groupStats.setGoalsFor(groupStats.getGoalsFor() + goalsFor);
                    groupStats.setGoalsAgainst(groupStats.getGoalsAgainst() + goalsAgainst);
                    if (goalsFor > goalsAgainst) groupStats.setWins(groupStats.getWins() + 1);
                    else if (goalsAgainst > goalsFor) groupStats.setLosses(groupStats.getLosses() + 1);
                    else groupStats.setDraws(groupStats.getDraws() + 1);
                });
        TeamCampaignDTO.EliminationPhaseStats elimStats = null;
        List<Game> elimGames = allGames.stream().filter(g -> g.getPhase() != GamePhase.GROUP_STAGE).toList();
        if (!elimGames.isEmpty()) {
            GamePhase furthestPhase = elimGames.stream().map(Game::getPhase).max(Enum::compareTo).get();
            elimStats = new TeamCampaignDTO.EliminationPhaseStats();
            elimStats.setReached(furthestPhase.toString());
            if (furthestPhase == GamePhase.FINAL) {
                Game finalGame = elimGames.stream().filter(g -> g.getPhase() == GamePhase.FINAL).findFirst().get();
                boolean wonFinal = (finalGame.getTeamA().getId().equals(teamId) && finalGame.getScoreTeamA() > finalGame.getScoreTeamB())
                        || (finalGame.getTeamB().getId().equals(teamId) && finalGame.getScoreTeamB() > finalGame.getScoreTeamA());
                elimStats.setFinalPosition(wonFinal ? 1 : 2);
            }
        }
        return new TeamCampaignDTO(team.getName(), competition.getName(), groupStats, elimStats);
    }

    @Transactional(readOnly = true)
    public GroupStandingsReportDTO getGroupStandings(Long groupId) {
        GameGroup group = gameGroupRepository.findById(groupId)
                .orElseThrow(() -> new ResourceNotFoundException("Grupo não encontrado com o ID: " + groupId));

        List<TeamStanding> standings = group.getTeams().stream()
                .map(TeamStanding::new)
                .collect(Collectors.toCollection(ArrayList::new));

        // Filtra para processar APENAS jogos da fase de grupos.
        // Isto impede que os jogos "bye" (W.O.) da fase eliminatória
        // (que estão ligados ao mesmo grupo) causem o crash 'NoSuchElementException'.
        List<Game> groupStageGames = group.getGames().stream()
                .filter(game -> game.getPhase() == GamePhase.GROUP_STAGE)
                .toList();

        // Itera sobre a lista filtrada
        for (Game game : groupStageGames) {
            // Apenas considera jogos que já terminaram
            // (Também inclui WO, caso a regra mude no futuro)
            if (game.getStatus() == GameStatus.FINISHED || game.getStatus() == GameStatus.WO) {
                // Esta linha (139) está agora segura.
                TeamStanding standingA = standings.stream().filter(s -> s.getTeam().equals(game.getTeamA())).findFirst().get();
                TeamStanding standingB = standings.stream().filter(s -> s.getTeam().equals(game.getTeamB())).findFirst().get();
                updateStandings(game, standingA, standingB);
            }
        }

        standings.sort(TeamStanding::compareTo);
        List<TeamStandingDTO> standingsDto = standings.stream().map(TeamStandingDTO::new).collect(Collectors.toList());
        return new GroupStandingsReportDTO(group.getId(), group.getName(), standingsDto);
    }

    private void updateStandings(Game game, TeamStanding standingA, TeamStanding standingB) {
        if(game.getScoreTeamA() == null || game.getScoreTeamB() == null){
            // Se o placar for nulo (ex: SCHEDULED), não faz nada.
            // A verificação no 'getGroupStandings' já previne isto, mas é uma boa prática.
            return;
        }
        standingA.setGoalsFor(standingA.getGoalsFor() + game.getScoreTeamA());
        standingA.setGoalsAgainst(standingA.getGoalsAgainst() + game.getScoreTeamB());
        standingB.setGoalsFor(standingB.getGoalsFor() + game.getScoreTeamB());
        standingB.setGoalsAgainst(standingB.getGoalsAgainst() + game.getScoreTeamA());
        if (game.getScoreTeamA() > game.getScoreTeamB()) {
            standingA.setPoints(standingA.getPoints() + 3);
            standingA.setWins(standingA.getWins() + 1);
        } else if (game.getScoreTeamB() > game.getScoreTeamA()) {
            standingB.setPoints(standingB.getPoints() + 3);
            standingB.setWins(standingB.getWins() + 1);
        } else {
            standingA.setPoints(standingA.getPoints() + 1);
            standingB.setPoints(standingB.getPoints() + 1);
        }
    }

    @Transactional(readOnly = true)
    public Top3ReportDTO getTop3Report(Long competitionId, Long sportId) {
        Competition competition = competitionRepository.findById(competitionId)
                .orElseThrow(() -> new ResourceNotFoundException("Competição não encontrada."));
        Sport sport = sportRepository.findById(sportId)
                .orElseThrow(() -> new ResourceNotFoundException("Desporto não encontrado."));
        Game finalGame = gameRepository.findByCompetitionIdAndSportIdAndPhase(competitionId, sportId, GamePhase.FINAL)
                .orElseThrow(() -> new BusinessException("A fase final para este desporto ainda não foi gerada."));
        if (finalGame.getStatus() == GameStatus.SCHEDULED) {
            throw new BusinessException("A final deste desporto ainda não foi concluída.");
        }
        Team champion = (finalGame.getScoreTeamA() > finalGame.getScoreTeamB()) ? finalGame.getTeamA() : finalGame.getTeamB();
        Team runnerUp = (finalGame.getScoreTeamA() > finalGame.getScoreTeamB()) ? finalGame.getTeamB() : finalGame.getTeamA();
        List<PodiumItemDTO> podium = new ArrayList<>();
        podium.add(new PodiumItemDTO(1, champion));
        podium.add(new PodiumItemDTO(2, runnerUp));
        gameRepository.findByCompetitionIdAndSportIdAndPhase(competitionId, sportId, GamePhase.THIRD_PLACE_DISPUTE).ifPresent(thirdPlaceGame -> {
            if (thirdPlaceGame.getStatus() != GameStatus.SCHEDULED) {
                Team thirdPlace = (thirdPlaceGame.getScoreTeamA() > thirdPlaceGame.getScoreTeamB()) ? thirdPlaceGame.getTeamA() : thirdPlaceGame.getTeamB();
                podium.add(new PodiumItemDTO(3, thirdPlace));
            }
        });
        Top3ReportDTO.CompetitionInfo compInfo = new Top3ReportDTO.CompetitionInfo(competition.getId(), competition.getName());
        Top3ReportDTO.SportInfo sportInfo = new Top3ReportDTO.SportInfo(sport.getId(), sport.getName());
        return new Top3ReportDTO(compInfo, sportInfo, podium);
    }
}