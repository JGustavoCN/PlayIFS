package br.edu.ifs.playifs.dto;

import br.edu.ifs.playifs.entities.Coordinator;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CoordinatorDTO {

    private Long id;
    private String registration;
    private String name;
    private String email;

    public CoordinatorDTO(Coordinator entity) {
        id = entity.getId();
        registration = entity.getUser().getRegistration(); // Busca a matrícula do User
        name = entity.getName();
        email = entity.getEmail();
    }
}