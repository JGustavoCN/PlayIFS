package br.edu.ifs.playifs.repositories;

import br.edu.ifs.playifs.entities.Athlete;
import br.edu.ifs.playifs.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface AthleteRepository extends JpaRepository<Athlete, Long> {
    Optional<Athlete> findByUser(User user);
}
