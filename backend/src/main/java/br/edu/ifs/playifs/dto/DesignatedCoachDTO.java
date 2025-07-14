package br.edu.ifs.playifs.dto;

import lombok.Data;

@Data
public class DesignatedCoachDTO {
    private Long sportId;
    private Long courseId;
    private Long athleteId;
}