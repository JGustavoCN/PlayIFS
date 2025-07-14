package br.edu.ifs.playifs.repositories;

import br.edu.ifs.playifs.entities.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role, Long> {
    Role findByAuthority(String authority);
}