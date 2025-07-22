package br.edu.ifs.playifs.dto.dashboard;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CompetitionParticipationDTO {
    private Long competitionId;
    private String competitionName;
    private List<SportParticipationDTO> sports;
}