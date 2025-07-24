package br.edu.ifs.playifs.competition;

import br.edu.ifs.playifs.competition.model.GameGroup;
import org.springframework.data.jpa.repository.JpaRepository;

public interface GameGroupRepository extends JpaRepository<GameGroup, Long> {
}
