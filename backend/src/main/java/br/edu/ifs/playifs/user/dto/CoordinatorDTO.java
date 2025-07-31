package br.edu.ifs.playifs.user.dto;

import br.edu.ifs.playifs.user.model.Coordinator;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Schema(description = "DTO para representar ou atualizar os dados de um Coordenador.")
public class CoordinatorDTO {

    @Schema(description = "ID único do perfil do coordenador.", example = "1", accessMode = Schema.AccessMode.READ_ONLY)
    private Long id;

    @Schema(description = "Matrícula única do coordenador, usada para login.", example = "coord01", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotBlank(message = "O campo matrícula é obrigatório.")
    private String registration;

    @Schema(description = "Nome completo do coordenador.", example = "Prof. Nelio Alves", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotBlank(message = "O campo nome é obrigatório.")
    private String name;

    @Schema(description = "Email de contato do coordenador.", example = "nelio.alves@ifs.edu.br", requiredMode = Schema.RequiredMode.REQUIRED)
    @Email(message = "Por favor, insira um email válido.")
    private String email;

    public CoordinatorDTO(Coordinator entity) {
        id = entity.getId();
        registration = entity.getUser().getRegistration();
        name = entity.getName();
        email = entity.getEmail();
    }
}