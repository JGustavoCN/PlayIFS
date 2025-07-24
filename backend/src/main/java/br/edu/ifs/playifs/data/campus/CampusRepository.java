package br.edu.ifs.playifs.data.campus;

import br.edu.ifs.playifs.data.campus.model.Campus;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CampusRepository extends JpaRepository<Campus, Long> {
    Page<Campus> findByNameContainingIgnoreCase(String name, Pageable pageable);

}
