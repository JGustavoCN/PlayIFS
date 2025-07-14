package br.edu.ifs.playifs.dto;

import lombok.Data;
import java.util.List;

@Data
public class TeamInsertDTO {
    private String name;
    private Long courseId;
    private Long sportId;
    private Long competitionId;
    private Long coachId;
    private List<Long> athleteIds;
}
