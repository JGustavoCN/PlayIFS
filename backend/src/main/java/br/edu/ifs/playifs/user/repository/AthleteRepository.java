package br.edu.ifs.playifs.user.repository;

import br.edu.ifs.playifs.user.model.Athlete;
import br.edu.ifs.playifs.user.model.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface AthleteRepository extends JpaRepository<Athlete, Long>, JpaSpecificationExecutor<Athlete> {

    Optional<Athlete> findByUser(User user);

    @Query("SELECT COUNT(a) > 0 FROM Athlete a JOIN a.teams t WHERE t.competition.id = :competitionId AND t.sport.id = :sportId AND a.id IN :athleteIds")
    boolean existsInAnotherTeamInCompetitionAndSport(Long competitionId, Long sportId, List<Long> athleteIds);

}