package br.edu.ifs.playifs.repositories;

import br.edu.ifs.playifs.entities.Game;
import org.springframework.data.jpa.repository.JpaRepository;

public interface GameRepository extends JpaRepository<Game, Long> {
}
