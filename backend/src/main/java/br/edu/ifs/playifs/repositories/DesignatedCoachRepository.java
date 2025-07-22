package br.edu.ifs.playifs.repositories;

import br.edu.ifs.playifs.entities.DesignatedCoach;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface DesignatedCoachRepository extends JpaRepository<DesignatedCoach, Long>, JpaSpecificationExecutor<DesignatedCoach> {

    // Método para verificar se uma designação específica já existe
    boolean existsByCompetitionIdAndSportIdAndCourseIdAndCoachId(Long competitionId, Long sportId, Long courseId, Long coachId);

    // Método para verificar se um técnico já foi definido para esta combinação
    boolean existsByCompetitionIdAndSportIdAndCourseId(Long competitionId, Long sportId, Long courseId);
    boolean existsByCompetitionIdAndSportIdAndCoachId(Long competitionId, Long sportId, Long coachId);

    void deleteByCompetitionIdAndSportIdAndCourseId(Long competitionId, Long sportId, Long courseId);


}