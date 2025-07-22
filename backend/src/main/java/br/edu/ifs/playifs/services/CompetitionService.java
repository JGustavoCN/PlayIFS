package br.edu.ifs.playifs.services;

import br.edu.ifs.playifs.dto.CompetitionDTO;
import br.edu.ifs.playifs.dto.DesignatedCoachDTO;
import br.edu.ifs.playifs.dto.GameDTO;
import br.edu.ifs.playifs.entities.*;
import br.edu.ifs.playifs.entities.enums.GamePhase;
import br.edu.ifs.playifs.entities.enums.GameStatus;
import br.edu.ifs.playifs.repositories.*;
import br.edu.ifs.playifs.services.exceptions.BusinessException;
import br.edu.ifs.playifs.services.exceptions.ResourceNotFoundException;
import br.edu.ifs.playifs.services.util.TeamStanding;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;
import java.util.stream.Collectors;

@Service
public class CompetitionService {

    @Autowired private CompetitionRepository repository;
    @Autowired private TeamRepository teamRepository;
    @Autowired private GameGroupRepository groupRepository;
    @Autowired private GameRepository gameRepository;
    @Autowired private DesignatedCoachRepository designatedCoachRepository;
    @Autowired private SportRepository sportRepository;
    @Autowired private CourseRepository courseRepository;
    @Autowired private AthleteRepository athleteRepository;

    // --- MÉTODOS DE CRUD PARA COMPETITION ---

    @Transactional(readOnly = true)
    public Page<CompetitionDTO> findAll(String name, Pageable pageable) {
        Page<Competition> page = repository.findByNameContainingIgnoreCase(name, pageable);
        return page.map(CompetitionDTO::new);
    }

    @Transactional(readOnly = true)
    public CompetitionDTO findById(Long id) {
        Competition entity = repository.findById(id).orElseThrow(
                () -> new ResourceNotFoundException("Competição não encontrada com o ID: " + id));
        return new CompetitionDTO(entity);
    }

    @Transactional
    public CompetitionDTO insert(CompetitionDTO dto) {
        Competition entity = new Competition();
        entity.setName(dto.getName());
        entity.setLevel(dto.getLevel());
        entity = repository.save(entity);
        return new CompetitionDTO(entity);
    }

    @Transactional
    public CompetitionDTO update(Long id, CompetitionDTO dto) {
        try {
            Competition entity = repository.getReferenceById(id);
            entity.setName(dto.getName());
            entity.setLevel(dto.getLevel());
            entity = repository.save(entity);
            return new CompetitionDTO(entity);
        }
        catch (EntityNotFoundException e) {
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
    public List<GameDTO> generateGroupStage(Long competitionId, Long sportId) {
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
            group.setName("Grupo " + (char) ('A' + i) + " - " + competition.getName() + " (" + teams.get(0).getSport().getName() + ")");
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
        return allNewGames.stream().map(GameDTO::new).toList();
    }

    @Transactional
    public List<GameDTO> generateEliminationStage(Long competitionId, Long sportId) {
        Competition competition = repository.findById(competitionId)
                .orElseThrow(() -> new BusinessException("Competição não encontrada."));

        List<Team> teamsOfSport = competition.getTeams().stream()
                .filter(team -> team.getSport().getId().equals(sportId))
                .toList();

        boolean isTournamentFinished = teamsOfSport.stream()
                .flatMap(team -> team.getGamesAsTeamA().stream())
                .anyMatch(game -> game.getPhase() == GamePhase.FINAL && game.getStatus() != GameStatus.SCHEDULED);

        if (isTournamentFinished) {
            throw new BusinessException("Este torneio já foi finalizado e não pode gerar novas fases.");
        }

        boolean allGroupGamesFinished = teamsOfSport.stream()
                .filter(team -> team.getGameGroup() != null)
                .flatMap(team -> team.getGameGroup().getGames().stream())
                .allMatch(game -> game.getStatus() == GameStatus.FINISHED || game.getStatus() == GameStatus.WO);

        if (!allGroupGamesFinished) {
            throw new BusinessException("Ainda existem jogos pendentes na fase de grupos para este esporte.");
        }

        List<Team> qualifiedTeams = new ArrayList<>();
        List<GameGroup> groups = teamsOfSport.stream()
                .map(Team::getGameGroup)
                .filter(java.util.Objects::nonNull)
                .distinct()
                .toList();

        for (GameGroup group : groups) {
            List<TeamStanding> standings = group.getTeams().stream()
                    .map(TeamStanding::new)
                    .collect(Collectors.toCollection(ArrayList::new));

            for (Game game : group.getGames()) {
                TeamStanding standingA = standings.stream().filter(s -> s.getTeam().equals(game.getTeamA())).findFirst().get();
                TeamStanding standingB = standings.stream().filter(s -> s.getTeam().equals(game.getTeamB())).findFirst().get();
                updateStandings(game, standingA, standingB);
            }

            standings.sort(TeamStanding::compareTo);
            if (!standings.isEmpty()) qualifiedTeams.add(standings.get(0).getTeam());
            if (standings.size() > 1) qualifiedTeams.add(standings.get(1).getTeam());
        }

        int numTeams = qualifiedTeams.size();
        if (numTeams < 2) {
            throw new BusinessException("Número de equipas qualificadas insuficiente para gerar a fase eliminatória.");
        }

        GamePhase currentPhase = getPhaseFor(numTeams);
        List<Game> eliminationGames = generateKnockoutRound(qualifiedTeams, currentPhase);

        gameRepository.saveAll(eliminationGames);
        return eliminationGames.stream().map(GameDTO::new).toList();
    }

    private List<Game> generateKnockoutRound(List<Team> teams, GamePhase phase) {
        int numTeams = teams.size();
        int nextPowerOfTwo = 1;
        while (nextPowerOfTwo < numTeams) {
            nextPowerOfTwo *= 2;
        }
        int byes = nextPowerOfTwo - numTeams;

        List<Team> teamsWithBye = new ArrayList<>(teams.subList(0, byes));
        List<Team> teamsInFirstRound = new ArrayList<>(teams.subList(byes, numTeams));

        List<Game> games = new ArrayList<>();
        Collections.shuffle(teamsInFirstRound);

        for (int i = 0; i < teamsInFirstRound.size() / 2; i++) {
            Team teamA = teamsInFirstRound.get(i);
            Team teamB = teamsInFirstRound.get(teamsInFirstRound.size() - 1 - i);
            games.add(createEliminationGame(teamA, teamB, phase));
        }

        System.out.println("Equipas com Bye (folga na ronda " + phase + "): " + teamsWithBye.stream().map(Team::getName).toList());

        return games;
    }

    private GamePhase getPhaseFor(int numberOfTeams) {
        if (numberOfTeams <= 2) return GamePhase.FINAL;
        if (numberOfTeams <= 4) return GamePhase.SEMI_FINALS;
        if (numberOfTeams <= 8) return GamePhase.QUARTER_FINALS;
        return GamePhase.FINAL; // Fallback
    }

    private List<Integer> calculateGroupSizes(int totalTeams) {
        if (totalTeams < 3) {
            return new ArrayList<>();
        }

        List<Integer> sizes = new ArrayList<>();
        int numGroupsOf4 = 0;
        int numGroupsOf3 = 0;

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
        return game;
    }

    private void updateStandings(Game game, TeamStanding standingA, TeamStanding standingB) {
        standingA.setGoalsFor(standingA.getGoalsFor() + game.getScoreTeamA());
        standingA.setGoalsAgainst(standingA.getGoalsAgainst() + game.getScoreTeamB());
        standingB.setGoalsFor(standingB.getGoalsFor() + game.getScoreTeamB());
        standingB.setGoalsAgainst(standingB.getGoalsAgainst() + game.getScoreTeamA());

        if (game.getScoreTeamA() > game.getScoreTeamB()) {
            standingA.setPoints(standingA.getPoints() + 3);
        } else if (game.getScoreTeamB() > game.getScoreTeamA()) {
            standingB.setPoints(standingB.getPoints() + 3);
        } else {
            standingA.setPoints(standingA.getPoints() + 1);
            standingB.setPoints(standingB.getPoints() + 1);
        }
    }
}