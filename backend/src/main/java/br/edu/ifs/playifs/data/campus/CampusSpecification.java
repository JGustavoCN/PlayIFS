package br.edu.ifs.playifs.data.campus;

import br.edu.ifs.playifs.data.campus.model.Campus;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.util.StringUtils;

public final class CampusSpecification {

    /**
     * Cria uma Specification para buscar campi por nome (case-insensitive).
     * @param name O nome ou parte do nome a ser buscado.
     * @return Uma Specification que pode ser usada em queries do JPA.
     */
    public static Specification<Campus> hasName(String name) {
        return (root, query, cb) -> {
            // Se o nome for nulo ou vazio, não aplica o filtro
            if (!StringUtils.hasText(name)) {
                return cb.conjunction(); // Retorna um predicado que é sempre verdadeiro
            }
            // Cria um predicado 'LIKE' case-insensitive: lower(root.name) like '%lower(name)%'
            return cb.like(cb.lower(root.get("name")), "%" + name.toLowerCase() + "%");
        };
    }
}