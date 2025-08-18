package br.edu.ifs.playifs.config;

import br.edu.ifs.playifs.security.SecurityFilter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.annotation.web.configurers.HeadersConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import java.util.Arrays;

import static br.edu.ifs.playifs.config.SecurityConstants.*;

@Configuration
@EnableWebSecurity
@EnableMethodSecurity
public class SecurityConfig {

    private final SecurityFilter securityFilter;

    public SecurityConfig(SecurityFilter securityFilter) {
        this.securityFilter = securityFilter;
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {

        return http
                .csrf(AbstractHttpConfigurer::disable)
                .headers(headers -> headers.frameOptions(HeadersConfigurer.FrameOptionsConfig::disable))
                .headers(headers -> headers.cacheControl(cache -> cache.disable()))
                .cors(cors -> cors.configurationSource(corsConfigurationSource()))
                .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
                .authorizeHttpRequests(authorize -> authorize
                        // =================================================================
                        // 1. ENDPOINTS PÚBLICOS (não exigem ‘token’)
                        // =================================================================
                        .requestMatchers(
                                "/v3/api-docs/**",
                                "/swagger-ui/**",
                                "/h2-console/**"
                        ).permitAll()
                        .requestMatchers(HttpMethod.POST,
                                "/api/v1/auth/**",
                                "/api/v1/athletes"
                        ).permitAll()
                        .requestMatchers(HttpMethod.GET,
                                "/api/v1/reports/**",
                                "/api/v1/config"
                        ).permitAll()

                        // =================================================================
                        // 2. ENDPOINTS DE LEITURA (qualquer utilizador autenticado)
                        // ESTE BLOCO DEVE VIR ANTES DAS REGRAS MAIS RESTRITIVAS DE COORDENADOR
                        // =================================================================
                        .requestMatchers(HttpMethod.GET,
                                "/api/v1/competitions/**",
                                "/api/v1/teams/**",
                                "/api/v1/games/**",
                                "/api/v1/athletes/**",
                                "/api/v1/coordinators/**",
                                "/api/v1/campuses/**",
                                "/api/v1/courses/**",
                                "/api/v1/sports/**",
                                "/api/v1/designated-coaches/**",
                                "/api/v1/me"
                        ).authenticated()

                        // =================================================================
                        // 3. ENDPOINTS DE AÇÕES PARA ATLETAS
                        // =================================================================
                        .requestMatchers(HttpMethod.GET, "/api/v1/dashboard/athlete").hasRole(ROLE_ATHLETE)
                        .requestMatchers(HttpMethod.POST, "/api/v1/teams").hasRole(ROLE_ATHLETE)
                        .requestMatchers(HttpMethod.PUT, "/api/v1/teams/{id}").hasRole(ROLE_ATHLETE)
                        .requestMatchers("/api/v1/teams/{id}/athletes/**").hasRole(ROLE_ATHLETE)

                        // =================================================================
                        // 4. ENDPOINTS DE ADMINISTRAÇÃO PARA COORDENADORES
                        // Apenas métodos de escrita (POST, PUT, DELETE, PATCH) e o dashboard
                        // =================================================================
                        .requestMatchers(HttpMethod.GET, "/api/v1/dashboard/coordinator").hasRole(ROLE_COORDINATOR)
                        .requestMatchers(
                                "/api/v1/competitions/**",
                                "/api/v1/games/**",
                                "/api/v1/designated-coaches/**",
                                "/api/v1/coordinators/**",
                                "/api/v1/campuses/**",
                                "/api/v1/courses/**",
                                "/api/v1/sports/**"
                        ).hasRole(ROLE_COORDINATOR)
                        .requestMatchers(HttpMethod.DELETE, "/api/v1/teams/**").hasRole(ROLE_COORDINATOR)
                        .requestMatchers(HttpMethod.PUT, "/api/v1/athletes/{id}").hasAnyRole(ROLE_ATHLETE, ROLE_COORDINATOR)
                        .requestMatchers("/api/v1/athletes/**").hasRole(ROLE_COORDINATOR) // Cobre o batch-create e batch-delete

                        // =================================================================
                        // 5. REGRA FINAL (fallback)
                        // Qualquer outra coisa não definida acima precisa de autenticação.
                        // As anotações de método (@IsCoordinator, etc.) farão a verificação final.
                        // =================================================================
                        .anyRequest().authenticated()
                )
                .addFilterBefore(securityFilter, UsernamePasswordAuthenticationFilter.class)
                .build();
    }

    // ... (resto da sua classe, que já está correta)

    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration configuration = new CorsConfiguration();
        configuration.setAllowedOriginPatterns(Arrays.asList("http://localhost:*", "http://127.0.0.1:*"));
        configuration.setAllowedMethods(Arrays.asList("GET", "POST", "PUT", "DELETE", "PATCH", "OPTIONS"));
        configuration.setAllowCredentials(true);
        configuration.setAllowedHeaders(Arrays.asList("Authorization", "Content-Type", "x-xsrf-token"));
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration);
        return source;
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration authenticationConfiguration) throws Exception {
        return authenticationConfiguration.getAuthenticationManager();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}