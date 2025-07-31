package br.edu.ifs.playifs.user.dto;

import br.edu.ifs.playifs.user.model.Coordinator;
import io.swagger.v3.oas.annotations.media.Schema;
// Importações de validação removidas (jakarta.validation.constraints.Email, jakarta.validation.constraints.NotBlank)
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Schema(description = "DTO para representar os dados detalhados de um Coordenador.") // Descrição atualizada
public class CoordinatorDetailsDTO { // Renomeado de CoordinatorDTO

    @Schema(description = "ID único do perfil do coordenador.", example = "1", accessMode = Schema.AccessMode.READ_ONLY)
    private Long id;

    @Schema(description = "Matrícula única do coordenador, usada para login.", example = "coord01") // Validação removida
    private String registration;

    @Schema(description = "Nome completo do coordenador.", example = "Prof. Nelio Alves") // Validação removida
    private String name;

    @Schema(description = "Email de contato do coordenador.", example = "nelio.alves@ifs.edu.br") // Validação removida
    private String email;

    public CoordinatorDetailsDTO(Coordinator entity) {
        id = entity.getId();
        registration = entity.getUser().getRegistration();
        name = entity.getName();
        email = entity.getEmail();
    }
}