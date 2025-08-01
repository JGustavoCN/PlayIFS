package br.edu.ifs.playifs.user.dto;

import br.edu.ifs.playifs.user.model.User;
import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.Set;
import java.util.stream.Collectors;

@Data
@Schema(description = "DTO unificado para representar o perfil do usuário logado.")
@JsonInclude(JsonInclude.Include.NON_NULL) // Oculta campos nulos
public class ProfileDTO {

    @Schema(description = "ID da conta do usuário.", example = "1")
    private Long userId;
    @Schema(description = "Matrícula do usuário.", example = "202301")
    private String registration;
    @Schema(description = "Lista de permissões (roles) do usuário.", example = "[\"ROLE_ATHLETE\"]")
    private Set<String> roles;
    @Schema(description = "Perfil de Atleta (presente se o usuário for um atleta).")
    private AthleteDetailsDTO athleteProfile; // Corrigido para AthleteDetailsDTO
    @Schema(description = "Perfil de Coordenador (presente se o usuário for um coordenador).")
    private CoordinatorDetailsDTO coordinatorProfile; // Corrigido para CoordinatorDetailsDTO

    public ProfileDTO(User user, AthleteDetailsDTO athleteProfile, CoordinatorDetailsDTO coordinatorProfile) { // Corrigido para AthleteDetailsDTO e CoordinatorDetailsDTO
        this.userId = user.getId();
        this.registration = user.getRegistration();
        this.roles = user.getRoles().stream().map(role -> role.getAuthority()).collect(Collectors.toSet());
        this.athleteProfile = athleteProfile;
        this.coordinatorProfile = coordinatorProfile;
    }
}