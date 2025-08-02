package br.edu.ifs.playifs.team;

import br.edu.ifs.playifs.team.model.Team;
import jakarta.persistence.criteria.JoinType;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.util.StringUtils;

public final class TeamSpecification {

    /**
     * Filtra equipes por nome (case-insensitive).
     */
    public static Specification<Team> hasName(String name) {
        return (root, query, cb) -> {
            if (!StringUtils.hasText(name)) {
                return cb.conjunction();
            }
            return cb.like(cb.lower(root.get("name")), "%" + name.toLowerCase() + "%");
        };
    }

    /**
     * Filtra equipes que pertencem a uma competição específica.
     */
    public static Specification<Team> inCompetition(Long competitionId) {
        return (root, query, cb) -> {
            if (competitionId == null) {
                return cb.conjunction();
            }
            // Usa Join para acessar o campo 'id' da entidade 'competition'
            return cb.equal(root.join("competition", JoinType.INNER).get("id"), competitionId);
        };
    }

    /**
     * Filtra equipes que praticam um esporte específico.
     */
    public static Specification<Team> ofSport(Long sportId) {
        return (root, query, cb) -> {
            if (sportId == null) {
                return cb.conjunction();
            }
            return cb.equal(root.join("sport", JoinType.INNER).get("id"), sportId);
        };
    }

    /**
     * Filtra equipes que pertencem a um curso específico.
     */
    public static Specification<Team> fromCourse(Long courseId) {
        return (root, query, cb) -> {
            if (courseId == null) {
                return cb.conjunction();
            }
            return cb.equal(root.join("course", JoinType.INNER).get("id"), courseId);
        };
    }
}