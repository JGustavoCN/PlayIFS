package br.edu.ifs.playifs.dto;

import br.edu.ifs.playifs.entities.Athlete;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class AthleteDTO {

    private Long id;
    private String registration;
    private String fullName;
    private String nickname;
    private String phone;
    private String email;

    public AthleteDTO(Athlete entity) {
        id = entity.getId();
        registration = entity.getUser().getRegistration(); // Busca a matrícula do User
        fullName = entity.getFullName();
        nickname = entity.getNickname();
        phone = entity.getPhone();
        email = entity.getEmail();
    }
}