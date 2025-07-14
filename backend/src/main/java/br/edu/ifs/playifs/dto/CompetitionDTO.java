package br.edu.ifs.playifs.dto;

import br.edu.ifs.playifs.entities.Competition;
import br.edu.ifs.playifs.entities.enums.CourseLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CompetitionDTO {

    private Long id;
    private String name;
    private CourseLevel level;

    public CompetitionDTO(Competition entity) {
        this.id = entity.getId();
        this.name = entity.getName();
        this.level = entity.getLevel();
    }
}
