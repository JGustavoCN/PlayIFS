package br.edu.ifs.playifs.dto.dashboard;

import br.edu.ifs.playifs.entities.Athlete;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AthleteDashboardDTO {
    private Long athleteId;
    private String fullName;
    private String nickname;
    private List<CompetitionParticipationDTO> participations;

    public AthleteDashboardDTO(Athlete athlete, List<CompetitionParticipationDTO> participations) {
        this.athleteId = athlete.getId();
        this.fullName = athlete.getFullName();
        this.nickname = athlete.getNickname();
        this.participations = participations;
    }
}