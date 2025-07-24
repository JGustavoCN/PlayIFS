package br.edu.ifs.playifs.report.dto;

import br.edu.ifs.playifs.team.model.Team;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
@Schema(description = "Representa uma equipa no pódio (top 3).")
public class PodiumItemDTO {
    @Schema(description = "Posição no pódio.", example = "1")
    private int position;

    @Schema(description = "Nome da equipa.", example = "Info Futsal PRO")
    private String teamName;

    @Schema(description = "Nome do curso da equipa.", example = "Técnico em Informática")
    private String course;

    @Schema(description = "Nome do campus da equipa.", example = "Campus Aracaju")
    private String campus;

    public PodiumItemDTO(int position, Team team) {
        this.position = position;
        this.teamName = team.getName();
        this.course = team.getCourse().getName();
        this.campus = team.getCourse().getCampus().getName();
    }
}