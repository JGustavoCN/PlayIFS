package br.edu.ifs.playifs.repositories;

import br.edu.ifs.playifs.entities.Team;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TeamRepository extends JpaRepository<Team, Long> {

    // Consulta para verificar se já existe uma equipe com a mesma combinação
    boolean existsBySportIdAndCourseIdAndCompetitionId(Long sportId, Long courseId, Long competitionId);
}
