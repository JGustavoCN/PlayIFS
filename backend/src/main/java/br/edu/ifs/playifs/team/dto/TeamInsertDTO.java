package br.edu.ifs.playifs.team.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import java.util.List;

@Data
@Schema(description = "DTO para a criação de uma nova equipa.")
public class TeamInsertDTO {
    @Schema(description = "Nome da equipa.", example = "Info Futsal PRO", requiredMode = Schema.RequiredMode.REQUIRED)
    private String name;
    @Schema(description = "ID do Curso ao qual a equipa pertence.", example = "1", requiredMode = Schema.RequiredMode.REQUIRED)
    private Long courseId;
    @Schema(description = "ID do Desporto que a equipa irá disputar.", example = "1", requiredMode = Schema.RequiredMode.REQUIRED)
    private Long sportId;
    @Schema(description = "ID da Competição na qual a equipa será inscrita.", example = "1", requiredMode = Schema.RequiredMode.REQUIRED)
    private Long competitionId;
    @Schema(description = "ID do Atleta que será o técnico da equipa (deve ser o mesmo do usuário logado).", example = "1", requiredMode = Schema.RequiredMode.REQUIRED)
    private Long coachId;
    @Schema(description = "Lista de IDs dos atletas que farão parte da equipa (o técnico deve estar incluído).", requiredMode = Schema.RequiredMode.REQUIRED)
    private List<Long> athleteIds;
}