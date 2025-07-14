package br.edu.ifs.playifs.dto;

import br.edu.ifs.playifs.entities.Campus;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CampusDTO {

    private Long id;
    private String name;

    public CampusDTO(Campus entity) {
        this.id = entity.getId();
        this.name = entity.getName();
    }
}
