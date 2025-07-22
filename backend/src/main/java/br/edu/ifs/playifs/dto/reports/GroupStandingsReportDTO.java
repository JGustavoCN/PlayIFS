package br.edu.ifs.playifs.dto.reports;

import lombok.AllArgsConstructor;
import lombok.Data;
import java.util.List;

@Data
@AllArgsConstructor
public class GroupStandingsReportDTO {
    private Long groupId;
    private String groupName;
    private List<TeamStandingDTO> standings;
}