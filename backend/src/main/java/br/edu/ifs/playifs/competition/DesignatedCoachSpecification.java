package br.edu.ifs.playifs.competition;

import br.edu.ifs.playifs.competition.model.DesignatedCoach;
import jakarta.persistence.criteria.JoinType;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.util.StringUtils;

public final class DesignatedCoachSpecification {

    public static Specification<DesignatedCoach> inCompetition(Long competitionId) {
        return (root, query, cb) -> competitionId == null ? cb.conjunction() :
                cb.equal(root.join("competition", JoinType.INNER).get("id"), competitionId);
    }

    public static Specification<DesignatedCoach> ofSport(Long sportId) {
        return (root, query, cb) -> sportId == null ? cb.conjunction() :
                cb.equal(root.join("sport", JoinType.INNER).get("id"), sportId);
    }

    public static Specification<DesignatedCoach> fromCourse(Long courseId) {
        return (root, query, cb) -> courseId == null ? cb.conjunction() :
                cb.equal(root.join("course", JoinType.INNER).get("id"), courseId);
    }

    public static Specification<DesignatedCoach> withAthleteName(String athleteName) {
        return (root, query, cb) -> {
            if (!StringUtils.hasText(athleteName)) {
                return cb.conjunction();
            }
            return cb.like(cb.lower(root.join("coach", JoinType.INNER).get("fullName")), "%" + athleteName.toLowerCase() + "%");
        };
    }
}