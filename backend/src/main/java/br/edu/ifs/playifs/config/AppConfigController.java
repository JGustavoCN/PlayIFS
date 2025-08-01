package br.edu.ifs.playifs.config;

import br.edu.ifs.playifs.config.dto.AppConfigDTO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/api/v1/config")
@Tag(name = "9. Configuração da Aplicação", description = "Endpoints para o front-end buscar configurações dinâmicas e valores de enums.")
public class AppConfigController {

    @Autowired
    private AppConfigService service;

    @GetMapping
    @Operation(summary = "Retorna configurações dinâmicas e listas de enums para o cliente",
            description = "Permite que o front-end obtenha valores de enums e outras configurações sem hardcoding, tornando a aplicação mais flexível.")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Configurações retornadas com sucesso.")
    })
    public ResponseEntity<AppConfigDTO> getAppConfig() {
        AppConfigDTO dto = service.getAppConfig();
        return ResponseEntity.ok(dto);
    }
}