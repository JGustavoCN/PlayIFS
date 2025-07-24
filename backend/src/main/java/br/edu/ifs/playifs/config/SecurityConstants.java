package br.edu.ifs.playifs.config;

import java.time.temporal.ChronoUnit;

/**
 * Classe para centralizar todas as constantes relacionadas à segurança e configuração da aplicação.
 * Segue o princípio DRY (Don't Repeat Yourself) para evitar "magic strings" e números mágicos,
 * facilitando a manutenção e prevenindo erros.
 */
public final class SecurityConstants {

    // Construtor privado para impedir a instanciação da classe.
    private SecurityConstants() {}

    // --- Constantes para o OpenAPI / Swagger ---
    public static final String SECURITY_SCHEME_NAME = "bearerAuth";

    // --- Constantes para as Permissões (Roles) ---
    // Usadas no SecurityConfig e nas anotações @PreAuthorize
    public static final String ROLE_COORDINATOR = "COORDINATOR";
    public static final String ROLE_ATHLETE = "ATHLETE";

    // --- Constantes para o JWT ---
    public static final String TOKEN_ISSUER = "playifs-api";
    public static final long ACCESS_TOKEN_EXPIRATION_HOURS = 2L; // Expiração do Access Token em horas
    public static final long REFRESH_TOKEN_EXPIRATION_DAYS = 7L;  // Expiração do Refresh Token em dias
}