package br.edu.ifs.playifs.repositories;

import br.edu.ifs.playifs.entities.Campus;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CampusRepository extends JpaRepository<Campus, Long> {
    Page<Campus> findByNameContainingIgnoreCase(String name, Pageable pageable);

}
