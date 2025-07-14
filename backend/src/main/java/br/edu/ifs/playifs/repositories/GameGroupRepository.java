package br.edu.ifs.playifs.repositories;

import br.edu.ifs.playifs.entities.GameGroup;
import org.springframework.data.jpa.repository.JpaRepository;

public interface GameGroupRepository extends JpaRepository<GameGroup, Long> {
}
