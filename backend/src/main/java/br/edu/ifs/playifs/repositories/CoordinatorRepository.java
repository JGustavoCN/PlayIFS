package br.edu.ifs.playifs.repositories;

import br.edu.ifs.playifs.entities.Coordinator;
import br.edu.ifs.playifs.entities.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface CoordinatorRepository extends JpaRepository<Coordinator, Long> {
    Optional<Coordinator> findByUser(User user);
    Page<Coordinator> findByNameContainingIgnoreCase(String name, Pageable pageable);

}