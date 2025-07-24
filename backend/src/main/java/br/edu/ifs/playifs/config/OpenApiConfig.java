package br.edu.ifs.playifs.config;

import io.swagger.v3.oas.models.Components;
import io.swagger.v3.oas.models.ExternalDocumentation;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Contact;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.info.License;
import io.swagger.v3.oas.models.responses.ApiResponse;
import io.swagger.v3.oas.models.security.SecurityRequirement;
import io.swagger.v3.oas.models.security.SecurityScheme;
import io.swagger.v3.oas.models.servers.Server;
import io.swagger.v3.oas.models.tags.Tag;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.List;

@Configuration
public class OpenApiConfig {

    @Bean
    public OpenAPI customOpenAPI() {

        return new OpenAPI()
                .info(new Info()
                        .title("PlayIFS API - Sistema de Gestão de Competições")
                        .description("API RESTful para o gerenciamento completo das competições esportivas internas do Instituto Federal de Sergipe (IFS).")
                        .version("v1.0.0")
                        .contact(new Contact()
                                .name("Equipa de Desenvolvimento PlayIFS")
                                .email("suporte.playifs@ifs.edu.br")
                                .url("https://github.com/JGustavoCN/PlayIFS"))
                        .license(new License()
                                .name("Apache 2.0")
                                .url("https://www.apache.org/licenses/LICENSE-2.0.html"))
                )
                .servers(List.of(
                        new Server().url("http://localhost:8080").description("Ambiente Local de Desenvolvimento"),
                        new Server().url("https://api-dev.playifs.edu.br").description("Ambiente de Homologação (Dev)")
                ))
                .externalDocs(new ExternalDocumentation()
                        .description("Repositório do Projeto no GitHub")
                        .url("https://github.com/JGustavoCN/PlayIFS"))

                .components(new Components()
                        .addSecuritySchemes(SecurityConstants.SECURITY_SCHEME_NAME, new SecurityScheme()
                                .name(SecurityConstants.SECURITY_SCHEME_NAME)
                                .type(SecurityScheme.Type.HTTP)
                                .scheme("bearer")
                                .bearerFormat("JWT"))
                        .addResponses("UnauthorizedError", new ApiResponse().description("Erro de autenticação. O token está ausente, é inválido ou expirou."))
                        .addResponses("ForbiddenError", new ApiResponse().description("Acesso negado. O seu perfil não tem permissão para executar esta ação."))
                        .addResponses("NotFoundError", new ApiResponse().description("O recurso solicitado não foi encontrado no sistema."))
                        .addResponses("BadRequestError", new ApiResponse().description("A requisição está malformada ou contém dados inválidos."))
                        .addResponses("UnprocessableEntityError", new ApiResponse().description("A requisição é válida, mas viola uma regra de negócio."))
                );
    }
}