package br.edu.ifs.playifs.user.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotEmpty;
import lombok.Data;

import java.util.List;

@Data
@Schema(description = "DTO para a requisição de criação de múltiplos atletas em massa.")
public class AthleteInputBatchDTO {

    @Schema(description = "Lista de atletas a serem criados.")
    @NotEmpty(message = "A lista de atletas não pode ser vazia.")
    private List<@Valid AthleteInputDTO> athletes;
}