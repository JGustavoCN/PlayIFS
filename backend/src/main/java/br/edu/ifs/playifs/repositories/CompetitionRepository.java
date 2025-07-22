package br.edu.ifs.playifs.repositories;

import br.edu.ifs.playifs.entities.Competition;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CompetitionRepository extends JpaRepository<Competition, Long> {
    // NOVO MÉTODO: Busca paginada de competições contendo uma string no nome.
    // O Spring Data JPA cria a consulta automaticamente a partir do nome do método.
    Page<Competition> findByNameContainingIgnoreCase(String name, Pageable pageable);


}
