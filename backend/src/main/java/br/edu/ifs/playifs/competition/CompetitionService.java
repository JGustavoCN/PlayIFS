package br.edu.ifs.playifs.competition;

import br.edu.ifs.playifs.competition.dto.*;
import br.edu.ifs.playifs.competition.model.Competition;
import br.edu.ifs.playifs.competition.model.GameGroup;
import br.edu.ifs.playifs.data.course.model.enums.CourseLevel;
import br.edu.ifs.playifs.data.sport.SportRepository;
import br.edu.ifs.playifs.data.sport.model.Sport;
import br.edu.ifs.playifs.game.GameRepository;
import br.edu.ifs.playifs.game.GameService;
import br.edu.ifs.playifs.game.GameSpecification;
import br.edu.ifs.playifs.game.dto.GameDetailsDTO;
import br.edu.ifs.playifs.game.dto.GameSummaryDTO;
import br.edu.ifs.playifs.game.model.Game;
import br.edu.ifs.playifs.game.model.enums.GamePhase;
import br.edu.ifs.playifs.game.model.enums.GameStatus;
import br.edu.ifs.playifs.report.ReportService;
import br.edu.ifs.playifs.report.dto.GroupStandingsReportDTO;
import br.edu.ifs.playifs.shared.exceptions.BusinessException;
import br.edu.ifs.playifs.shared.exceptions.ResourceNotFoundException;
import br.edu.ifs.playifs.shared.util.TeamStanding;
import br.edu.ifs.playifs.shared.web.dto.PageDTO;
import br.edu.ifs.playifs.team.TeamRepository;
import br.edu.ifs.playifs.team.model.Team;
import jakarta.persistence.EntityNotFoundException;
import jakarta.persistence.criteria.Join;
import jakarta.persistence.criteria.JoinType;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.*;
import java.util.concurrent.atomic.AtomicReference;
import java.util.stream.Collectors;

@Service
public class CompetitionService {

    private final CompetitionRepository repository;
    private final TeamRepository teamRepository;
    private final GameGroupRepository groupRepository;
    private final GameRepository gameRepository;
    private final ReportService reportService;
    private final SportRepository sportRepository; // Nova dependência

    private final GameService gameService;

    public CompetitionService(CompetitionRepository repository, TeamRepository teamRepository, GameGroupRepository groupRepository, GameRepository gameRepository, GameService gameService, ReportService reportService, SportRepository sportRepository) {
        this.repository = repository;
        this.teamRepository = teamRepository;
        this.groupRepository = groupRepository;
        this.gameRepository = gameRepository;
        this.reportService = reportService;
        this.sportRepository = sportRepository;
        this.gameService = gameService;
    }

    @Transactional(readOnly = true)
    public PageDTO<CompetitionSummaryDTO> findAll(String name, CourseLevel level, Pageable pageable) {
        Specification<Competition> spec = Specification.anyOf();
        spec = spec.and(CompetitionSpecification.hasName(name));
        spec = spec.and(CompetitionSpecification.hasLevel(level));
        Page<Competition> page = repository.findAll(spec, pageable);
        Page<CompetitionSummaryDTO> pageDto = page.map(CompetitionSummaryDTO::new);
        return new PageDTO<>(pageDto);
    }

    @Transactional(readOnly = true)
    public CompetitionDetailsDTO findById(Long id) {
        Competition entity = repository.findById(id).orElseThrow(
                () -> new ResourceNotFoundException("Competição não encontrada com o ID: " + id));
        return new CompetitionDetailsDTO(entity);
    }

    @Transactional
    public CompetitionDetailsDTO insert(CompetitionInputDTO dto) {
        Competition entity = new Competition();
        copyDtoToEntity(dto, entity);
        entity = repository.save(entity);
        return new CompetitionDetailsDTO(entity);
    }

    @Transactional
    public CompetitionDetailsDTO update(Long id, CompetitionInputDTO dto) {
        try {
            Competition entity = repository.getReferenceById(id);
            copyDtoToEntity(dto, entity);
            entity = repository.save(entity);
            return new CompetitionDetailsDTO(entity);
        } catch (EntityNotFoundException e) {
            throw new ResourceNotFoundException("Recurso não encontrado com o ID: " + id);
        }
    }

    @Transactional
    public void delete(Long id) {
        if (!repository.existsById(id)) {
            throw new ResourceNotFoundException("Recurso não encontrado com o ID: " + id);
        }
        Competition competition = repository.findById(id).get();
        if (!competition.getTeams().isEmpty()) {
            throw new BusinessException("Não é possível apagar uma competição que já possui equipas inscritas.");
        }
        repository.deleteById(id);
    }

    @Transactional
    public void batchDelete(List<Long> ids) {
        List<Competition> competitionsToDelete = repository.findAllById(ids);
        if (competitionsToDelete.size() != ids.size()) {
            throw new ResourceNotFoundException("Uma ou mais competições não foram encontradas.");
        }
        for (Competition competition : competitionsToDelete) {
            if (!competition.getTeams().isEmpty()) {
                throw new BusinessException("Não é possível apagar a competição '" + competition.getName() + "' (ID: " + competition.getId() + ") pois ela já possui equipas inscritas.");
            }
        }
        repository.deleteAllInBatch(competitionsToDelete);
    }

    // ✅ MÉTODO AUXILIAR ATUALIZADO COM A LÓGICA DE ASSOCIAÇÃO
    private void copyDtoToEntity(CompetitionInputDTO dto, Competition entity) {
        entity.setName(dto.getName());
        entity.setLevel(dto.getLevel());

        // Limpa a lista antiga para garantir que a atualização substitua os desportos
        entity.getSports().clear();

        if (dto.getSportIds() != null && !dto.getSportIds().isEmpty()) {
            // Busca todas as entidades Sport com base nos IDs fornecidos
            List<Sport> sports = sportRepository.findAllById(dto.getSportIds());
            if (sports.size() != dto.getSportIds().size()) {
                throw new ResourceNotFoundException("Um ou mais IDs de desportos fornecidos não foram encontrados.");
            }
            // Adiciona os desportos encontrados à competição
            entity.setSports(new HashSet<>(sports));
        }
    }

    @Transactional
    public List<GameDetailsDTO> generateGroupStage(Long competitionId, Long sportId) {
        Competition competition = repository.findById(competitionId)
                .orElseThrow(() -> new BusinessException("Competição não encontrada."));
        List<Team> teams = competition.getTeams().stream()
                .filter(team -> team.getSport().getId().equals(sportId))
                .collect(Collectors.toList());
        boolean groupsAlreadyExist = teams.stream().anyMatch(team -> team.getGameGroup() != null);
        if (groupsAlreadyExist) {
            throw new BusinessException("A fase de grupos para este desporto já foi gerada.");
        }
        if (teams.size() < 3) {
            throw new BusinessException("São necessárias no mínimo 3 equipes para gerar a fase de grupos.");
        }
        Collections.shuffle(teams);
        AtomicReference<Instant> nextGameTime = new AtomicReference<>(Instant.now().plus(2, ChronoUnit.DAYS).truncatedTo(ChronoUnit.HOURS));
        long gameIntervalHours = 2;
        int totalTeams = teams.size();
        List<Integer> groupSizes = calculateGroupSizes(totalTeams);
        List<Game> allNewGames = new ArrayList<>();
        int teamIndex = 0;
        for (int i = 0; i < groupSizes.size(); i++) {
            int size = groupSizes.get(i);
            GameGroup group = new GameGroup();
            group.setName("Grupo " + (char) ('A' + i) + " - " + competition.getName() + " (" + teams.getFirst().getSport().getName() + ")");
            group = groupRepository.save(group);
            List<Team> groupTeams = new ArrayList<>();
            for (int j = 0; j < size; j++) {
                Team team = teams.get(teamIndex++);
                team.setGameGroup(group);
                teamRepository.save(team);
                groupTeams.add(team);
            }
            List<Game> groupGames = createGamesForGroup(group, groupTeams, nextGameTime, gameIntervalHours);
            allNewGames.addAll(groupGames);
        }
        gameRepository.saveAll(allNewGames);
        return allNewGames.stream().map(GameDetailsDTO::new).toList();
    }

    @Transactional
    public List<GameDetailsDTO> generateEliminationStage(Long competitionId, Long sportId) {
        Competition competition = repository.findById(competitionId)
                .orElseThrow(() -> new ResourceNotFoundException("Competição não encontrada."));

        List<Game> allEliminationGames = gameRepository.findAllEliminationGamesByCompetitionAndSport(competitionId, sportId);

        boolean hasPendingGames = allEliminationGames.stream()
                .anyMatch(game -> game.getStatus() == GameStatus.SCHEDULED);
        if (hasPendingGames) {
            throw new BusinessException("Existem jogos da fase eliminatória atual que ainda não foram finalizados.");
        }

        boolean tournamentIsFinished = allEliminationGames.stream()
                .anyMatch(game -> game.getPhase() == GamePhase.FINAL && game.getStatus() != GameStatus.SCHEDULED);
        if (tournamentIsFinished) {
            throw new BusinessException("Este torneio já foi finalizado e não pode gerar novas fases.");
        }

        List<Game> newGames = new ArrayList<>();
        GamePhase lastPlayedPhase = allEliminationGames.stream()
                .map(Game::getPhase)
                .max(Comparator.comparing(Enum::ordinal))
                .orElse(null);

        if (lastPlayedPhase == null) {
            List<Team> teamsForNextRound = getTeamsFromGroupStage(competition, sportId);
            if (teamsForNextRound.size() < 2) {
                throw new BusinessException("Não há equipas suficientes para gerar a fase eliminatória.");
            }
            GamePhase nextPhase = getPhaseFor(teamsForNextRound.size());
            newGames.addAll(generateKnockoutRound(teamsForNextRound, nextPhase));

        } else if (lastPlayedPhase == GamePhase.SEMI_FINALS) {
            List<Game> semiFinalGames = allEliminationGames.stream()
                    .filter(g -> g.getPhase() == GamePhase.SEMI_FINALS).toList();

            // Proteção para garantir que os jogos "bye" (W.O.) também sejam contados como vencedores
            List<Team> winners = semiFinalGames.stream().map(this::getWinner).filter(Objects::nonNull).toList();
            List<Team> losers = semiFinalGames.stream().map(this::getLoser).filter(Objects::nonNull).toList();

            if (winners.size() == 2) {
                newGames.add(createEliminationGame(winners.get(0), winners.get(1), GamePhase.FINAL));
            }
            if (losers.size() == 2) {
                newGames.add(createEliminationGame(losers.get(0), losers.get(1), GamePhase.THIRD_PLACE_DISPUTE));
            }
        } else {
            List<Team> winners = allEliminationGames.stream()
                    .filter(game -> game.getPhase() == lastPlayedPhase)
                    .map(this::getWinner) // getWinner lida com 'WO' e 'FINISHED'
                    .filter(Objects::nonNull) // Garantir que não há nulos
                    .toList();
            List<Team> teamsForNextRound = new ArrayList<>(winners);

            if (teamsForNextRound.size() < 2) {
                throw new BusinessException("O torneio foi concluído. Não há novas fases para gerar.");
            }

            // 3. Determinar a próxima fase com base no n.º de vencedores
            GamePhase nextPhase = getPhaseFor(teamsForNextRound.size());

            // 4. Verificação de segurança para impedir a recriação da mesma fase
            if (nextPhase == lastPlayedPhase) {
                throw new BusinessException("Não foi possível avançar. A fase " + nextPhase + " já foi jogada e os vencedores não são suficientes para a próxima fase.");
            }

            newGames.addAll(generateKnockoutRound(teamsForNextRound, nextPhase));

        }

        if (newGames.isEmpty()) {
            throw new BusinessException("Nenhuma nova fase a ser gerada no momento. O torneio pode ter sido concluído.");
        }

        gameRepository.saveAll(newGames);
        return newGames.stream().map(GameDetailsDTO::new).toList();
    }

    @Transactional(readOnly = true)
    public GroupStageViewDTO getGroupStageView(Long competitionId, Long sportId) {
        List<GameGroup> groups = groupRepository.findByCompetitionIdAndSportId(competitionId, sportId);
        if (groups.isEmpty()) {
            throw new ResourceNotFoundException("Fase de grupos não encontrada ou ainda não gerada para esta competição/desporto.");
        }

        List<GroupStandingsReportDTO> standingsReports = groups.stream()
                .map(group -> reportService.getGroupStandings(group.getId()))
                .collect(Collectors.toList());

        List<GameSummaryDTO> games = gameService.findAll(
                null, // 1. teamId
                competitionId, // 2. competitionId
                sportId, // 3. sportId
                null, // 4. status (DEVE SER NULL)
                GamePhase.GROUP_STAGE, // 5. phase (DEVE SER GROUP_STAGE)
                Pageable.unpaged() // 6. pageable
        ).getContent();

        return new GroupStageViewDTO(standingsReports, games);
    }

    @Transactional(readOnly = true)
    public EliminationBracketDTO getEliminationBracketView(Long competitionId, Long sportId) {
        List<Game> eliminationGames = gameRepository.findAllEliminationGamesByCompetitionAndSport(competitionId, sportId);
        if (eliminationGames.isEmpty()) {
            throw new ResourceNotFoundException("Fase eliminatória não encontrada ou ainda não gerada.");
        }
        Map<GamePhase, List<GameDetailsDTO>> rounds = eliminationGames.stream()
                .sorted(Comparator.comparing(Game::getDateTime, Comparator.nullsLast(Comparator.naturalOrder())))
                .collect(Collectors.groupingBy(
                        Game::getPhase,
                        TreeMap::new,
                        Collectors.mapping(GameDetailsDTO::new, Collectors.toList())
                ));
        return new EliminationBracketDTO(rounds);
    }

    private List<Team> getTeamsFromGroupStage(Competition competition, Long sportId) {
        List<Team> teamsOfSport = competition.getTeams().stream()
                .filter(team -> team.getSport().getId().equals(sportId))
                .toList();
        boolean allGroupGamesFinished = teamsOfSport.stream()
                .filter(team -> team.getGameGroup() != null)
                .flatMap(team -> team.getGameGroup().getGames().stream())
                .allMatch(game -> game.getStatus() == GameStatus.FINISHED || game.getStatus() == GameStatus.WO);
        if (!allGroupGamesFinished) {
            throw new BusinessException("Ainda existem jogos pendentes na fase de grupos para este esporte.");
        }
        List<GameGroup> groups = teamsOfSport.stream()
                .map(Team::getGameGroup)
                .filter(Objects::nonNull)
                .distinct()
                .toList();
        List<TeamStanding> firstPlaceFinishers = new ArrayList<>();
        List<TeamStanding> secondPlaceFinishers = new ArrayList<>();
        for (GameGroup group : groups) {
            List<TeamStanding> standings = group.getTeams().stream()
                    .map(TeamStanding::new)
                    .collect(Collectors.toCollection(ArrayList::new));
            List<Game> groupStageGames = group.getGames().stream()
                    .filter(game -> game.getPhase() == GamePhase.GROUP_STAGE)
                    .toList();
            for (Game game : groupStageGames) {
                if (game.getStatus() == GameStatus.FINISHED || game.getStatus() == GameStatus.WO) {
                    TeamStanding standingA = standings.stream().filter(s -> s.getTeam().equals(game.getTeamA())).findFirst().get();
                    TeamStanding standingB = standings.stream().filter(s -> s.getTeam().equals(game.getTeamB())).findFirst().get();
                    updateStandings(game, standingA, standingB);
                }
            }
            standings.sort(TeamStanding::compareTo);
            if (!standings.isEmpty()) firstPlaceFinishers.add(standings.get(0));
            if (standings.size() > 1) secondPlaceFinishers.add(standings.get(1));
        }
        firstPlaceFinishers.sort(TeamStanding::compareTo);
        secondPlaceFinishers.sort(TeamStanding::compareTo);
        List<Team> qualifiedTeams = new ArrayList<>();
        firstPlaceFinishers.forEach(standing -> qualifiedTeams.add(standing.getTeam()));
        secondPlaceFinishers.forEach(standing -> qualifiedTeams.add(standing.getTeam()));
        return qualifiedTeams;
    }

    private List<Game> generateKnockoutRound(List<Team> teams, GamePhase phase) {
        int numTeams = teams.size();
        List<Team> teamsToPlay = new ArrayList<>(teams);
        List<Game> games = new ArrayList<>(); // ✅ Inicializa a lista aqui

        int byes = getNextPowerOfTwo(numTeams) - numTeams;
        List<Team> teamsWithBye = new ArrayList<>(); // ✅ Lista para guardar os byes

        if (byes > 0 && numTeams > 2) {
            // A sua lógica original pega os 'byes'
            // do topo da lista (os melhores classificados)
            teamsWithBye.addAll(teams.subList(0, byes));
            teamsToPlay.removeAll(teamsWithBye);
        }

        // 1. (Lógica antiga) Criar jogos reais
        for (int i = 0; i < teamsToPlay.size() / 2; i++) {
            Team teamA = teamsToPlay.get(i);
            Team teamB = teamsToPlay.get(teamsToPlay.size() - 1 - i);
            games.add(createEliminationGame(teamA, teamB, phase));
        }

        // 2. ✅ NOVA LÓGICA: Criar jogos "fantasma" para os Byes
        for (Team teamWithBye : teamsWithBye) {
            // Cria um jogo com TeamB nulo
            Game byeGame = createEliminationGame(teamWithBye, null, phase);

            // Um "bye" é um jogo instantaneamente "terminado" por W.O.
            // (Usamos WO pois o seu código já o reconhece em getTeamsFromGroupStage)
            byeGame.setStatus(GameStatus.WO);
            byeGame.setScoreTeamA(1); // Resultado simbólico (W)
            byeGame.setScoreTeamB(0); // Resultado simbólico (O)

            games.add(byeGame);
        }

        return games;
    }

    private GamePhase getPhaseFor(int numberOfTeams) {
        if (numberOfTeams <= 2) return GamePhase.FINAL;
        if (numberOfTeams <= 4) return GamePhase.SEMI_FINALS;
        if (numberOfTeams <= 8) return GamePhase.QUARTER_FINALS;
        return GamePhase.ROUND_OF_16;
    }

    private int getNextPowerOfTwo(int n) {
        int power = 1;
        while (power < n) {
            power *= 2;
        }
        return power;
    }

    private Team getWinner(Game game) {
        if(game.getScoreTeamA() == null || game.getScoreTeamB() == null){
            throw new BusinessException("O jogo " + game.getId() + " não possui placar definido.");
        }
        if (game.getScoreTeamA() > game.getScoreTeamB()) return game.getTeamA();
        return game.getTeamB();
    }

    private Team getLoser(Game game) {
        if(game.getScoreTeamA() == null || game.getScoreTeamB() == null){
            throw new BusinessException("O jogo " + game.getId() + " não possui placar definido.");
        }
        if (game.getScoreTeamA() < game.getScoreTeamB()) return game.getTeamA();
        return game.getTeamB();
    }

    private List<Integer> calculateGroupSizes(int totalTeams) {
        if (totalTeams < 3) return new ArrayList<>();
        List<Integer> sizes = new ArrayList<>();
        int numGroupsOf4 = 0, numGroupsOf3 = 0;
        switch (totalTeams % 3) {
            case 0:
                numGroupsOf3 = totalTeams / 3;
                break;
            case 1:
                numGroupsOf4 = 1;
                numGroupsOf3 = (totalTeams - 4) / 3;
                break;
            case 2:
                if (totalTeams == 5) {
                    sizes.add(5);
                    return sizes;
                }
                numGroupsOf4 = 2;
                numGroupsOf3 = (totalTeams - 8) / 3;
                break;
        }
        for (int i = 0; i < numGroupsOf4; i++) sizes.add(4);
        for (int i = 0; i < numGroupsOf3; i++) sizes.add(3);
        return sizes;
    }

    private List<Game> createGamesForGroup(GameGroup group, List<Team> teams, AtomicReference<Instant> nextGameTime, long intervalHours) {
        List<Game> games = new ArrayList<>();
        for (int i = 0; i < teams.size(); i++) {
            for (int j = i + 1; j < teams.size(); j++) {
                Game game = new Game();
                game.setPhase(GamePhase.GROUP_STAGE);
                game.setStatus(GameStatus.SCHEDULED);
                game.setGroup(group);
                game.setTeamA(teams.get(i));
                game.setTeamB(teams.get(j));
                game.setDateTime(nextGameTime.get());
                nextGameTime.set(nextGameTime.get().plus(intervalHours, ChronoUnit.HOURS));
                games.add(game);
            }
        }
        return games;
    }

    private Game createEliminationGame(Team teamA, Team teamB, GamePhase phase) {
        Game game = new Game();
        game.setPhase(phase);
        game.setStatus(GameStatus.SCHEDULED);
        game.setTeamA(teamA);
        game.setTeamB(teamB);
        if (teamA != null) {
            game.setGroup(teamA.getGameGroup());
        }
        return game;
    }

    private void updateStandings(Game game, TeamStanding standingA, TeamStanding standingB) {
        if(game.getScoreTeamA() == null || game.getScoreTeamB() == null){
            throw new BusinessException("O jogo " + game.getId() + " não possui placar definido.");
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
}