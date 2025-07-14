package br.edu.ifs.playifs.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true) // Herda os campos e métodos de AthleteDTO
public class AthleteInsertDTO extends AthleteDTO {
    private String password;
}
