package br.edu.ifs.playifs.auth.dto;

import io.swagger.v3.oas.annotations.media.Schema;

@Schema(description = "DTO para a resposta de renovação de token bem-sucedida.")
public record RefreshTokenResponseDTO(
        @Schema(description = "Um novo token de acesso JWT de curta duração.")
        String accessToken,

        @Schema(description = "Um novo token de atualização de longa duração, que substitui o antigo.")
        String refreshToken
) {}