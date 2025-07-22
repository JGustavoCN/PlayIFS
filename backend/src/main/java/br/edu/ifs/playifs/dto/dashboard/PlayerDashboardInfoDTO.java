package br.edu.ifs.playifs.dto.dashboard;

import br.edu.ifs.playifs.entities.Athlete;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PlayerDashboardInfoDTO {
    private Long id;
    private String fullName;
    private String nickname;

    public PlayerDashboardInfoDTO(Athlete entity) {
        this.id = entity.getId();
        this.fullName = entity.getFullName();
        this.nickname = entity.getNickname();
    }
}