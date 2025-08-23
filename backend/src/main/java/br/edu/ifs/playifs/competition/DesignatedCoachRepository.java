package br.edu.ifs.playifs.competition;

import br.edu.ifs.playifs.competition.model.DesignatedCoach;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.Optional;

public interface DesignatedCoachRepository extends JpaRepository<DesignatedCoach, Long>, JpaSpecificationExecutor<DesignatedCoach> {

    // Método para verificar se uma designação específica já existe
    boolean existsByCompetitionIdAndSportIdAndCourseIdAndCoachId(Long competitionId, Long sportId, Long courseId, Long coachId);

    // Método para verificar se um técnico já foi definido para esta combinação
    boolean existsByCompetitionIdAndSportIdAndCourseId(Long competitionId, Long sportId, Long courseId);
    boolean existsByCompetitionIdAndSportIdAndCoachId(Long competitionId, Long sportId, Long coachId);

    void deleteByCompetitionIdAndSportIdAndCourseId(Long competitionId, Long sportId, Long courseId);

    Optional<DesignatedCoach> findByCompetitionIdAndSportIdAndCourseId(Long competitionId, Long sportId, Long courseId);

}