package br.edu.ifs.playifs.competition;

import br.edu.ifs.playifs.competition.model.GameGroup;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface GameGroupRepository extends JpaRepository<GameGroup, Long> {
    @Query("SELECT DISTINCT gg FROM GameGroup gg JOIN gg.teams t WHERE t.competition.id = :competitionId AND t.sport.id = :sportId")
    List<GameGroup> findByCompetitionIdAndSportId(Long competitionId, Long sportId);

}
