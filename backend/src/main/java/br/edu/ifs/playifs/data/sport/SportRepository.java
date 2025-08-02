package br.edu.ifs.playifs.data.sport;

import br.edu.ifs.playifs.data.sport.model.Sport;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface SportRepository extends JpaRepository<Sport, Long>, JpaSpecificationExecutor<Sport> {

}