package br.edu.ifs.playifs.user.dto;

import br.edu.ifs.playifs.user.model.Coordinator;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.Instant;

@Data
@NoArgsConstructor
@Schema(description = "DTO para representar os dados detalhados de um Coordenador.")
public class CoordinatorDetailsDTO {

    @Schema(description = "ID único do perfil do coordenador.", example = "1")
    private Long id;

    @Schema(description = "Matrícula única do coordenador, usada para login.", example = "coord01")
    private String registration;

    @Schema(description = "Nome completo do coordenador.", example = "Prof. Nelio Alves")
    private String name;

    @Schema(description = "Email de contato do coordenador.", example = "nelio.alves@ifs.edu.br")
    private String email;

    @Schema(description = "Data e hora da criação do registo.", accessMode = Schema.AccessMode.READ_ONLY)
    private Instant createdAt;

    @Schema(description = "Data e hora da última atualização do registo.", accessMode = Schema.AccessMode.READ_ONLY)
    private Instant updatedAt;

    public CoordinatorDetailsDTO(Coordinator entity) {
        this.id = entity.getId();
        this.registration = entity.getUser().getRegistration();
        this.name = entity.getName();
        this.email = entity.getEmail();
        this.createdAt = entity.getCreatedAt();
        this.updatedAt = entity.getUpdatedAt();
    }
}