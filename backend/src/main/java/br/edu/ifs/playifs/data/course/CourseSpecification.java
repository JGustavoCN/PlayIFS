package br.edu.ifs.playifs.data.course;

import br.edu.ifs.playifs.data.course.model.Course;
import br.edu.ifs.playifs.data.course.model.enums.CourseLevel;
import jakarta.persistence.criteria.JoinType;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.util.StringUtils;

public final class CourseSpecification {

    public static Specification<Course> hasName(String name) {
        return (root, query, cb) -> {
            if (!StringUtils.hasText(name)) {
                return cb.conjunction();
            }
            return cb.like(cb.lower(root.get("name")), "%" + name.toLowerCase() + "%");
        };
    }

    public static Specification<Course> inCampus(Long campusId) {
        return (root, query, cb) -> {
            if (campusId == null) {
                return cb.conjunction();
            }
            return cb.equal(root.join("campus", JoinType.INNER).get("id"), campusId);
        };
    }

    public static Specification<Course> hasLevel(CourseLevel level) {
        return (root, query, cb) -> {
            if (level == null) {
                return cb.conjunction();
            }
            return cb.equal(root.get("level"), level);
        };
    }
}