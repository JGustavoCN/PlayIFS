package br.edu.ifs.playifs.repositories;

import br.edu.ifs.playifs.entities.Competition;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CompetitionRepository extends JpaRepository<Competition, Long> {
}
