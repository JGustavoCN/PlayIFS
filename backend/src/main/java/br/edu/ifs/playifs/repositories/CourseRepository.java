package br.edu.ifs.playifs.repositories;

import br.edu.ifs.playifs.entities.Course;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CourseRepository extends JpaRepository<Course, Long> {
}