// main/java/br/edu/ifs/playifs/config/dto/AppConfigDTO.java
package br.edu.ifs.playifs.config.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.Map;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "DTO que contém todas as configurações e dados dinâmicos para o cliente da aplicação.")
public class AppConfigDTO {

    @Schema(description = "Mapeamento de nomes de enums para suas listas de valores (nome e valor).")
    private Map<String, List<EnumValueDTO>> enums;

    // Você pode adicionar outras configurações aqui no futuro, se necessário
    // @Schema(description = "Configurações gerais da aplicação, como URLs externas, limites, etc.")
    // private Map<String, String> generalSettings;
}