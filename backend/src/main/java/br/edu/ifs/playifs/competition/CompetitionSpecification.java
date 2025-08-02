package br.edu.ifs.playifs.competition;

import br.edu.ifs.playifs.competition.model.Competition;
import br.edu.ifs.playifs.data.course.model.enums.CourseLevel;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.util.StringUtils;

public final class CompetitionSpecification {

    public static Specification<Competition> hasName(String name) {
        return (root, query, cb) -> {
            if (!StringUtils.hasText(name)) {
                return cb.conjunction();
            }
            return cb.like(cb.lower(root.get("name")), "%" + name.toLowerCase() + "%");
        };
    }

    public static Specification<Competition> hasLevel(CourseLevel level) {
        return (root, query, cb) -> {
            if (level == null) {
                return cb.conjunction();
            }
            return cb.equal(root.get("level"), level);
        };
    }
}