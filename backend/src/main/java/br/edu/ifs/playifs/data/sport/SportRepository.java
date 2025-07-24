package br.edu.ifs.playifs.data.sport;

import br.edu.ifs.playifs.data.sport.model.Sport;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SportRepository extends JpaRepository<Sport, Long> {

    // NOVO MÉTODO: Busca paginada de desportos contendo uma string no nome.
    Page<Sport> findByNameContainingIgnoreCase(String name, Pageable pageable);
}