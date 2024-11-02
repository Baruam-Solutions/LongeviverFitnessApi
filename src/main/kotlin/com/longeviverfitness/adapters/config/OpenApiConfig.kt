package com.longeviverfitness.adapters.config

import io.swagger.v3.oas.models.OpenAPI
import io.swagger.v3.oas.models.info.Contact
import io.swagger.v3.oas.models.info.Info
import io.swagger.v3.oas.models.info.License
import io.swagger.v3.oas.models.security.SecurityRequirement
import io.swagger.v3.oas.models.security.SecurityScheme
import io.swagger.v3.oas.models.servers.Server
import io.swagger.v3.oas.models.tags.Tag
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration

@Configuration
class OpenApiConfig {


    @Bean
    fun customOpenAPI(): OpenAPI {
        return OpenAPI()
            .info(
                Info()
                    .title("Longeviver Fitness API")
                    .version("1.0")
                    .description("API para o aplicativo Longeviver Fitness, fornecendo acesso a recursos de saúde e bem-estar.")
                    .termsOfService("https://longeviver.com/terms")  // Termos de uso
                    .contact(
                        Contact()
                            .name("Equipe de Desenvolvimento Longeviver")
                            .email("contato@longeviver.com")
                            .url("https://github.com/equipe-longeviver")
                    )
                    .license(
                        License()
                            .name("Licença MIT")
                            .url("https://opensource.org/licenses/MIT")
                    )
            )
            .servers(
                listOf(
                    Server().url("http://localhost:8080").description("Ambiente de desenvolvimento"),
                    Server().url("https://api.longeviver.com").description("Ambiente de produção")
                )
            )
            .addTagsItem(Tag().name("Usuário").description("Operações relacionadas aos usuários do sistema"))
            .components(
                io.swagger.v3.oas.models.Components().apply {
                    addSecuritySchemes(
                        "bearerAuth",
                        SecurityScheme()
                            .type(SecurityScheme.Type.HTTP)
                            .scheme("bearer")
                            .bearerFormat("JWT")
                            .description("JWT usado para autenticação")
                    )
                }
            )
            .addSecurityItem(SecurityRequirement().addList("bearerAuth"))
    }
}