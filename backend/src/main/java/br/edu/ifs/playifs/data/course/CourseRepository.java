package br.edu.ifs.playifs.data.course;

import br.edu.ifs.playifs.data.course.model.Course;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface CourseRepository extends JpaRepository<Course, Long> {

    @Query("SELECT obj FROM Course obj WHERE "
            + "(:name IS NULL OR LOWER(obj.name) LIKE LOWER(CONCAT('%', :name, '%'))) AND "
            + "(:campusId IS NULL OR obj.campus.id = :campusId)")
    Page<Course> find(String name, Long campusId, Pageable pageable);
}

