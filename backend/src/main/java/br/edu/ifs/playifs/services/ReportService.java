package br.edu.ifs.playifs.services;

import br.edu.ifs.playifs.dto.reports.*;
import br.edu.ifs.playifs.entities.*;
import br.edu.ifs.playifs.entities.enums.GamePhase;
import br.edu.ifs.playifs.entities.enums.GameStatus;
import br.edu.ifs.playifs.repositories.*;
import br.edu.ifs.playifs.services.exceptions.BusinessException;
import br.edu.ifs.playifs.services.exceptions.ResourceNotFoundException;
import br.edu.ifs.playifs.services.util.TeamStanding;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ReportService {

    @Autowired private GameGroupRepository gameGroupRepository;
    @Autowired private GameRepository gameRepository;
    @Autowired private CompetitionRepository competitionRepository;
    @Autowired private SportRepository sportRepository;
    @Autowired private TeamRepository teamRepository;

    @Transactional(readOnly = true)
    public WoSummaryReportDTO getWoSummary(Long competitionId) {
        // Busca todos os jogos com status WO na competição especificada
        List<Game> woGames = gameRepository.findAllByCompetitionAndStatus(competitionId, GameStatus.WO);

        // Mapeia a lista de entidades para a lista de DTOs
        List<WoGameInfoDTO> woGamesDto = woGames.stream()
                .map(WoGameInfoDTO::new)
                .collect(Collectors.toList());

        // Monta o relatório final
        return new WoSummaryReportDTO(woGames.size(), woGamesDto);
    }

    @Transactional(readOnly = true)
    public SportStatisticsDTO getSportStatistics(Long competitionId, Long sportId) {
        long totalGames = gameRepository.countFinishedGamesByCompetitionAndSport(competitionId, sportId);

        if (totalGames == 0) {
            return new SportStatisticsDTO(); // Retorna estatísticas zeradas se não houver jogos
        }

        Long totalGoals = gameRepository.sumTotalGoalsByCompetitionAndSport(competitionId, sportId);
        totalGoals = (totalGoals == null) ? 0L : totalGoals; // Prevenir NullPointerException se a soma for nula

        double averageGoals = (double) totalGoals / totalGames;

        List<Game> highestScoringGames = gameRepository.findHighestScoringGames(competitionId, sportId, PageRequest.of(0, 1));
        HighestScoringGameDTO highestScoringGameDto = !highestScoringGames.isEmpty()
                ? new HighestScoringGameDTO(highestScoringGames.get(0))
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

        // Calcular estatísticas da fase de grupos
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

        // Analisar fase eliminatória
        TeamCampaignDTO.EliminationPhaseStats elimStats = null;
        List<Game> elimGames = allGames.stream().filter(g -> g.getPhase() != GamePhase.GROUP_STAGE).toList();

        if (!elimGames.isEmpty()) {
            GamePhase furthestPhase = elimGames.stream().map(Game::getPhase).max(Enum::compareTo).get();
            elimStats = new TeamCampaignDTO.EliminationPhaseStats();
            elimStats.setReached(furthestPhase.toString());

            // Determinar posição final se a final foi jogada
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

        // Reutiliza a nossa classe de utilitário para calcular as estatísticas
        List<TeamStanding> standings = group.getTeams().stream()
                .map(TeamStanding::new)
                .collect(Collectors.toCollection(ArrayList::new));

        for (Game game : group.getGames()) {
            // Apenas considera jogos que já terminaram
            if (game.getStatus() != null && game.getStatus().toString().equals("FINISHED")) {
                TeamStanding standingA = standings.stream().filter(s -> s.getTeam().equals(game.getTeamA())).findFirst().get();
                TeamStanding standingB = standings.stream().filter(s -> s.getTeam().equals(game.getTeamB())).findFirst().get();
                updateStandings(game, standingA, standingB);
            }
        }

        // Ordena a classificação
        standings.sort(TeamStanding::compareTo);

        // Converte para DTOs
        List<TeamStandingDTO> standingsDto = standings.stream().map(TeamStandingDTO::new).collect(Collectors.toList());

        return new GroupStandingsReportDTO(group.getId(), group.getName(), standingsDto);
    }

    // Método auxiliar para atualizar os pontos (pode ser movido para uma classe de utilitário no futuro)
    private void updateStandings(Game game, TeamStanding standingA, TeamStanding standingB) {
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

        // Valida se o jogo da final foi concluído
        Game finalGame = gameRepository.findByCompetitionIdAndSportIdAndPhase(competitionId, sportId, GamePhase.FINAL)
                .orElseThrow(() -> new BusinessException("A fase final para este desporto ainda não foi gerada."));

        if (finalGame.getStatus() == GameStatus.SCHEDULED) {
            throw new BusinessException("A final deste desporto ainda não foi concluída.");
        }

        // Determina 1º e 2º lugar
        Team champion = (finalGame.getScoreTeamA() > finalGame.getScoreTeamB()) ? finalGame.getTeamA() : finalGame.getTeamB();
        Team runnerUp = (finalGame.getScoreTeamA() > finalGame.getScoreTeamB()) ? finalGame.getTeamB() : finalGame.getTeamA();

        List<PodiumItemDTO> podium = new ArrayList<>();
        podium.add(new PodiumItemDTO(1, champion));
        podium.add(new PodiumItemDTO(2, runnerUp));

        // Tenta encontrar o 3º lugar (se houver disputa)
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