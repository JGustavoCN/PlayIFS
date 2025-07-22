package br.edu.ifs.playifs.dto;

import lombok.Data;
import java.time.Instant;

@Data
public class GameUpdateDTO {
    private Instant dateTime;
}