package br.edu.ifs.playifs.game;

import br.edu.ifs.playifs.game.model.Game;
import br.edu.ifs.playifs.team.model.Team;
import br.edu.ifs.playifs.game.model.enums.GamePhase;
import br.edu.ifs.playifs.game.model.enums.GameStatus;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.time.Instant;
import java.util.List;
import java.util.Optional;

public interface GameRepository extends JpaRepository<Game, Long> {

    @Query("SELECT obj FROM Game obj WHERE (:teamId IS NULL OR obj.teamA.id = :teamId OR obj.teamB.id = :teamId)")
    Page<Game> findByTeam(Long teamId, Pageable pageable);

    long countByStatusAndDateTimeBefore(GameStatus status, Instant now);

    List<Game> findTop5ByStatusOrderByDateTimeAsc(GameStatus status);

    @Query("SELECT g FROM Game g JOIN g.teamA.athletes a WHERE a.id = :athleteId AND g.status = 'SCHEDULED' ORDER BY g.dateTime ASC")
    List<Game> findNextPlayerGames(Long athleteId, Pageable pageable);

    @Query("SELECT g FROM Game g JOIN g.teamA.athletes a WHERE a.id = :athleteId AND g.status <> 'SCHEDULED' ORDER BY g.dateTime DESC")
    List<Game> findLastPlayerResults(Long athleteId, Pageable pageable);

    @Query("SELECT g FROM Game g JOIN g.teamA t WHERE t.competition.id = :competitionId AND t.sport.id = :sportId AND g.phase = :phase")
    Optional<Game> findByCompetitionIdAndSportIdAndPhase(Long competitionId, Long sportId, GamePhase phase);

    @Query("SELECT g FROM Game g WHERE (g.teamA.id = :teamId OR g.teamB.id = :teamId) AND g.teamA.competition.id = :competitionId")
    List<Game> findAllByTeamAndCompetition(Long teamId, Long competitionId);

    @Query("SELECT COUNT(g) FROM Game g WHERE g.teamA.competition.id = :competitionId AND g.teamA.sport.id = :sportId AND g.status <> 'SCHEDULED'")
    long countFinishedGamesByCompetitionAndSport(Long competitionId, Long sportId);

    @Query("SELECT SUM(g.scoreTeamA + g.scoreTeamB) FROM Game g WHERE g.teamA.competition.id = :competitionId AND g.teamA.sport.id = :sportId AND g.status <> 'SCHEDULED'")
    Long sumTotalGoalsByCompetitionAndSport(Long competitionId, Long sportId);

    @Query("SELECT g FROM Game g WHERE g.teamA.competition.id = :competitionId AND g.teamA.sport.id = :sportId AND g.status <> 'SCHEDULED' ORDER BY (g.scoreTeamA + g.scoreTeamB) DESC")
    List<Game> findHighestScoringGames(Long competitionId, Long sportId, Pageable pageable);

    @Query("SELECT g FROM Game g WHERE g.teamA.competition.id = :competitionId AND g.status = :status")
    List<Game> findAllByCompetitionAndStatus(Long competitionId, GameStatus status);

    Optional<Game> findTop1ByTeamAOrTeamBAndStatusOrderByDateTimeAsc(Team teamA, Team teamB, GameStatus status);


}