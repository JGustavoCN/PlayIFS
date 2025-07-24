package br.edu.ifs.playifs.team.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import java.util.List;

@Data
@Schema(description = "DTO para transportar uma lista de IDs de atletas.")
public class AthleteListDTO {
    @Schema(description = "Lista de IDs de atletas.", requiredMode = Schema.RequiredMode.REQUIRED)
    private List<Long> athleteIds;
}