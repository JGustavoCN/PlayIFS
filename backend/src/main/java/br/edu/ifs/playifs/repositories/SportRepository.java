package br.edu.ifs.playifs.repositories;

import br.edu.ifs.playifs.entities.Sport;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SportRepository extends JpaRepository<Sport, Long> {
}
