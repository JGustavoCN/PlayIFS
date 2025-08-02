package br.edu.ifs.playifs.user.coordinator;

import br.edu.ifs.playifs.user.model.Coordinator;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.util.StringUtils;

public final class CoordinatorSpecification {

    /**
     * Cria uma Specification para buscar coordenadores por nome (case-insensitive).
     * @param name O nome ou parte do nome a ser buscado.
     * @return Uma Specification que pode ser usada em queries do JPA.
     */
    public static Specification<Coordinator> hasName(String name) {
        return (root, query, cb) -> {
            if (!StringUtils.hasText(name)) {
                return cb.conjunction();
            }
            return cb.like(cb.lower(root.get("name")), "%" + name.toLowerCase() + "%");
        };
    }
}