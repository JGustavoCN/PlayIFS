package br.edu.ifs.playifs.user.athlete;

import br.edu.ifs.playifs.user.model.Athlete;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.util.StringUtils;

public final class AthleteSpecification {

    /**
     * Cria uma Specification para buscar atletas por nome completo (case-insensitive).
     * @param name O nome ou parte do nome a ser buscado.
     * @return Uma Specification que pode ser usada em queries do JPA.
     */
    public static Specification<Athlete> hasFullName(String name) {
        return (root, query, cb) -> {
            if (!StringUtils.hasText(name)) {
                return cb.conjunction();
            }
            return cb.like(cb.lower(root.get("fullName")), "%" + name.toLowerCase() + "%");
        };
    }
}