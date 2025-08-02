package br.edu.ifs.playifs.competition.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotEmpty;
import lombok.Data;

import java.util.List;

@Data
@Schema(description = "DTO para a requisição de criação ou atualização de múltiplas designações de técnicos em massa.")
public class DesignatedCoachInputBatchDTO {

    @Schema(description = "Lista de designações de técnicos a serem criadas ou atualizadas.")
    @NotEmpty(message = "A lista de designações não pode ser vazia.")
    private List<@Valid DesignatedCoachInputDTO> coaches;
}