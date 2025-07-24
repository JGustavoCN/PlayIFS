package br.edu.ifs.playifs.user.repository;

import br.edu.ifs.playifs.user.model.Coordinator;
import br.edu.ifs.playifs.user.model.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface CoordinatorRepository extends JpaRepository<Coordinator, Long> {
    Optional<Coordinator> findByUser(User user);
    Page<Coordinator> findByNameContainingIgnoreCase(String name, Pageable pageable);

}