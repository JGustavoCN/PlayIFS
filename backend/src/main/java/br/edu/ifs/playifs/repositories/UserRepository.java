package br.edu.ifs.playifs.repositories;

import br.edu.ifs.playifs.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.security.core.userdetails.UserDetails;
import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {

    @Query("SELECT obj FROM User obj JOIN FETCH obj.roles WHERE obj.registration = :registration")
    UserDetails findByRegistration(String registration);

    Optional<User> findByRefreshToken(String token);
}