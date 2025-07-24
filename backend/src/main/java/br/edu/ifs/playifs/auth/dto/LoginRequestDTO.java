package br.edu.ifs.playifs.auth.dto;

import io.swagger.v3.oas.annotations.media.Schema;

@Schema(description = "DTO para a requisição de login. Requer a matrícula e a senha do usuário.")
public record LoginRequestDTO(
        @Schema(description = "Matrícula única do usuário.", example = "coord01")
        String registration,

        @Schema(description = "Senha do usuário.", example = "123456")
        String password
) {}