package br.edu.ifs.playifs.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class CoordinatorInsertDTO extends CoordinatorDTO {
    private String password;
}