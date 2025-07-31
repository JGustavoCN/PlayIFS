package br.edu.ifs.playifs.team.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import lombok.Data;
import java.util.List;

@Data
@Schema(description = "DTO para transportar uma lista de IDs de atletas.")
public class AthleteListDTO {
    @Schema(description = "Lista de IDs de atletas a serem adicionados.", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotEmpty(message = "A lista de IDs de atletas não pode ser vazia.")
    private List<@NotNull @Positive Long> athleteIds;
}