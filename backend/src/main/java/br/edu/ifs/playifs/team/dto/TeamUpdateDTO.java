package br.edu.ifs.playifs.team.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Data
@Schema(description = "DTO para a atualização dos dados básicos de uma equipa (ex: nome).")
public class TeamUpdateDTO {
    @Schema(description = "Novo nome para a equipa.", example = "Info Futsal PRO 2025")
    private String name;
}