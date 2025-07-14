package br.edu.ifs.playifs.dto;

import br.edu.ifs.playifs.entities.Course;
import br.edu.ifs.playifs.entities.enums.CourseLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CourseDTO {

    private Long id;
    private String name;
    private CourseLevel level;
    private CampusDTO campus; // Representando o relacionamento

    public CourseDTO(Course entity) {
        this.id = entity.getId();
        this.name = entity.getName();
        this.level = entity.getLevel();
        // Importante: convertemos a entidade Campus para CampusDTO
        this.campus = new CampusDTO(entity.getCampus());
    }
}
