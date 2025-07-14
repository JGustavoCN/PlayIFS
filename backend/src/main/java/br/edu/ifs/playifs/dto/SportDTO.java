package br.edu.ifs.playifs.dto;

import br.edu.ifs.playifs.entities.Sport;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SportDTO {

    private Long id;
    private String name;
    private Integer minAthletes;
    private Integer maxAthletes;

    // Construtor que converte a entidade para DTO
    public SportDTO(Sport entity) {
        this.id = entity.getId();
        this.name = entity.getName();
        this.minAthletes = entity.getMinAthletes();
        this.maxAthletes = entity.getMaxAthletes();
    }
}
