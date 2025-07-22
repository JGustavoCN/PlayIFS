package br.edu.ifs.playifs.dto.reports;

import br.edu.ifs.playifs.entities.Team;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class PodiumItemDTO {
    private int position;
    private String teamName;
    private String course;
    private String campus;

    public PodiumItemDTO(int position, Team team) {
        this.position = position;
        this.teamName = team.getName();
        this.course = team.getCourse().getName();
        this.campus = team.getCourse().getCampus().getName();
    }
}