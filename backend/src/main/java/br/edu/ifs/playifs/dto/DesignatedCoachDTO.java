package br.edu.ifs.playifs.dto;

import br.edu.ifs.playifs.entities.DesignatedCoach;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor // Mantém o construtor vazio
public class DesignatedCoachDTO {
    private Long sportId;
    private Long courseId;
    private Long athleteId;
    private Long competitionId; // Adicionar para clareza na resposta

    // NOVO CONSTRUTOR: Para criar o DTO a partir da entidade
    public DesignatedCoachDTO(DesignatedCoach entity) {
        this.sportId = entity.getSport().getId();
        this.courseId = entity.getCourse().getId();
        this.athleteId = entity.getCoach().getId();
        this.competitionId = entity.getCompetition().getId();
    }
}