package br.edu.ifs.playifs.dto;

import lombok.Data;
import java.util.List;

@Data
public class AthleteListDTO {
    private List<Long> athleteIds;
}