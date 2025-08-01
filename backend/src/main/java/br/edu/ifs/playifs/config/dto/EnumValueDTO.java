package br.edu.ifs.playifs.config.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "DTO para representar um valor de enum, com seu nome e valor associado.")
public class EnumValueDTO {

    @Schema(description = "Nome legível do valor do enum.", example = "INTEGRADO")
    private String name;

    @Schema(description = "Valor programático do enum.", example = "INTEGRADO")
    private String value;
}