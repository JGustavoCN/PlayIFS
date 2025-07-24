package br.edu.ifs.playifs.user.dto;

import br.edu.ifs.playifs.user.model.Coordinator;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Schema(description = "DTO para representar os dados de um coordenador.")
public class CoordinatorDTO {

    @Schema(description = "ID único do coordenador.", example = "1")
    private Long id;

    @Schema(description = "Matrícula do coordenador, usada para login.", example = "coord01", requiredMode = Schema.RequiredMode.REQUIRED)
    private String registration;

    @Schema(description = "Nome completo do coordenador.", example = "Prof. Nélio Alves", requiredMode = Schema.RequiredMode.REQUIRED)
    private String name;

    @Schema(description = "Email de contato do coordenador.", example = "nelio.alves@ifs.edu.br", requiredMode = Schema.RequiredMode.REQUIRED)
    private String email;

    public CoordinatorDTO(Coordinator entity) {
        id = entity.getId();
        registration = entity.getUser().getRegistration();
        name = entity.getName();
        email = entity.getEmail();
    }
}