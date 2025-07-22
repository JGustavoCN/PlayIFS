package br.edu.ifs.playifs.config;

import io.swagger.v3.oas.models.Components;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Contact;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.info.License;
import io.swagger.v3.oas.models.security.SecurityScheme;
import io.swagger.v3.oas.models.servers.Server;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class OpenApiConfig {

    @Bean
    public OpenAPI customOpenAPI() {
        // Define o nome de referência que usaremos para o nosso esquema de segurança.
        final String securitySchemeName = "bearerAuth";

        return new OpenAPI()
                // Define as informações do esquema de segurança (Bearer Token JWT).
                .components(
                        new Components()
                                .addSecuritySchemes(securitySchemeName,
                                        new SecurityScheme()
                                                .name(securitySchemeName)
                                                .type(SecurityScheme.Type.HTTP)
                                                .scheme("bearer")
                                                .bearerFormat("JWT")
                                )
                )
                // Adiciona informações de contato, licença e detalhes da API.
                .info(new Info()
                        .title("PlayIFS API")
                        .description("Documentação da API completa para o projeto PlayIFS, sistema de gerenciamento de jogos internos do IFS.")
                        .version("v1.0")
                        .contact(new Contact()
                                .name("Equipa de Desenvolvimento PlayIFS")
                                .email("suporte.playifs@ifs.edu.br"))
                        .license(new License()
                                .name("Apache 2.0")
                                .url("https://www.apache.org/licenses/LICENSE-2.0.html"))
                )
                // Adiciona as URLs dos ambientes onde a API está disponível.
                .addServersItem(new Server().url("http://localhost:8080").description("Ambiente Local"))
                .addServersItem(new Server().url("https://api.playifs.dev.br").description("Ambiente de Desenvolvimento"));
    }
}