package br.edu.ifs.playifs.dashboard.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.springframework.hateoas.RepresentationModel;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = false)
@Schema(description = "DTO que agrupa as participações de um atleta por competição.")
public class CompetitionParticipationDTO extends RepresentationModel<CompetitionParticipationDTO> {

    @Schema(description = "ID da competição.", example = "1")
    private Long competitionId;

    @Schema(description = "Nome da competição.", example = "JIFS 2025 - Etapa Aracaju")
    private String competitionName;

    @Schema(description = "Lista de desportos nos quais o atleta está a participar nesta competição.")
    private List<SportParticipationDTO> sports;
}