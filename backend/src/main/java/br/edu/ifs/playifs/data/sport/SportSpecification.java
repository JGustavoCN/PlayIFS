package br.edu.ifs.playifs.data.sport;

import br.edu.ifs.playifs.data.sport.model.Sport;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.util.StringUtils;

public final class SportSpecification {

    /**
     * Cria uma Specification para buscar desportos por nome (case-insensitive).
     * @param name O nome ou parte do nome a ser buscado.
     * @return Uma Specification que pode ser usada em queries do JPA.
     */
    public static Specification<Sport> hasName(String name) {
        return (root, query, cb) -> {
            if (!StringUtils.hasText(name)) {
                return cb.conjunction();
            }
            return cb.like(cb.lower(root.get("name")), "%" + name.toLowerCase() + "%");
        };
    }
}