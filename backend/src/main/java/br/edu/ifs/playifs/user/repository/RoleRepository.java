package br.edu.ifs.playifs.user.repository;

import br.edu.ifs.playifs.user.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role, Long> {
    Role findByAuthority(String authority);
}