package br.edu.ifs.playifs.repositories;

import br.edu.ifs.playifs.entities.Athlete;
import br.edu.ifs.playifs.entities.Team;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor; // Importar
import org.springframework.data.jpa.repository.Query;

import java.util.List;

// ADICIONE A EXTENSÃO JpaSpecificationExecutor<Team> AQUI
public interface TeamRepository extends JpaRepository<Team, Long>, JpaSpecificationExecutor<Team> {

    boolean existsBySportIdAndCourseIdAndCompetitionId(Long sportId, Long courseId, Long competitionId);
    boolean existsByCompetitionIdAndSportIdAndCoachId(Long competitionId, Long sportId, Long coachId);

    @Query("SELECT COUNT(t) > 0 FROM Team t WHERE t.competition.id = :competitionId AND t.coach.id IN :athleteIds")
    boolean anyOfTheseAthletesAreCoachesInCompetition(Long competitionId, List<Long> athleteIds);

    @Query("SELECT COUNT(t) > 0 FROM Team t WHERE t.competition.id = :competitionId AND t.sport.id = :sportId AND t.coach.id IN :athleteIds")
    boolean anyOfTheseAthletesAreCoachesInCompetitionAndSport(Long competitionId, Long sportId, List<Long> athleteIds);

    List<Team> findByCoach(Athlete coach);
}