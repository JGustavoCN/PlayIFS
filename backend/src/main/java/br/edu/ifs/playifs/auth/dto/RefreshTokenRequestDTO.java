package br.edu.ifs.playifs.auth.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank; // Importar a anotação

@Schema(description = "DTO para a requisição de renovação de token.")
public record RefreshTokenRequestDTO(
        @Schema(description = "Token de atualização válido obtido no login.", example = "a1b2c3d4-e5f6-7890-g1h2-i3j4k5l6m7n8", requiredMode = Schema.RequiredMode.REQUIRED)
        @NotBlank(message = "O refresh token é obrigatório.") // Validação
        String refreshToken
) {}