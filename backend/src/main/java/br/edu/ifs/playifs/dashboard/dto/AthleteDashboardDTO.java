package br.edu.ifs.playifs.dashboard.dto;

import br.edu.ifs.playifs.user.model.Athlete;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.springframework.hateoas.RepresentationModel;

import java.util.List;

@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@Schema(description = "DTO que agrega todas as informações para o dashboard do atleta.")
public class AthleteDashboardDTO extends RepresentationModel<AthleteDashboardDTO> {

    @Schema(description = "ID do atleta logado.", example = "15")
    private Long athleteId;

    @Schema(description = "Nome completo do atleta.", example = "José Carlos")
    private String fullName;

    @Schema(description = "Apelido do atleta.", example = "Zeca")
    private String nickname;

    @Schema(description = "Lista de participações do atleta, agrupadas por competição.")
    private List<CompetitionParticipationDTO> participations;

    public AthleteDashboardDTO(Athlete athlete, List<CompetitionParticipationDTO> participations) {
        this.athleteId = athlete.getId();
        this.fullName = athlete.getFullName();
        this.nickname = athlete.getNickname();
        this.participations = participations;
    }
}