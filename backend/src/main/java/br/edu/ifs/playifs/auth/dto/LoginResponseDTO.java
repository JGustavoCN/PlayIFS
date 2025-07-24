package br.edu.ifs.playifs.auth.dto;

import io.swagger.v3.oas.annotations.media.Schema;

@Schema(description = "DTO para a resposta de login bem-sucedido. Retorna os tokens de acesso e de atualização.")
public record LoginResponseDTO(
        @Schema(description = "Token de acesso JWT de curta duração. Usado para autorizar requisições aos endpoints protegidos.")
        String accessToken,

        @Schema(description = "Token de atualização de longa duração. Usado para obter um novo accessToken sem precisar de um novo login.")
        String refreshToken
) {}