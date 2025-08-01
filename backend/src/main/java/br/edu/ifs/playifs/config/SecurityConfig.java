package br.edu.ifs.playifs.config;

import br.edu.ifs.playifs.security.SecurityFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
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

    @Autowired
    private SecurityFilter securityFilter;

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {

        return http
                .csrf(csrf -> csrf.disable())
                .headers(headers -> headers.frameOptions(frame -> frame.disable()))
                .cors(cors -> cors.configurationSource(corsConfigurationSource()))
                .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
                .authorizeHttpRequests(authorize -> authorize
                        // =================================================================
                        // 1. ENDPOINTS PÚBLICOS (não exigem token)
                        // =================================================================
                        .requestMatchers("/h2-console/**").permitAll()
                        .requestMatchers("/v3/api-docs/**", "/swagger-ui.html", "/swagger-ui/**").permitAll()
                        // ATUALIZADO: Inclui /api/v1/ nos caminhos
                        .requestMatchers(HttpMethod.POST, "/api/v1/auth/login", "/api/v1/auth/refresh-token").permitAll()
                        .requestMatchers(HttpMethod.POST, "/api/v1/athletes").permitAll()
                        .requestMatchers(HttpMethod.GET, "/api/v1/reports/**").permitAll()
                        .requestMatchers(HttpMethod.GET, "/api/v1/config").permitAll() // O novo endpoint de configuração também é público

                        // =================================================================
                        // 2. ENDPOINTS DE LEITURA (qualquer utilizador autenticado)
                        // =================================================================
                        // ATUALIZADO: Inclui /api/v1/ nos caminhos
                        .requestMatchers(HttpMethod.GET, "/api/v1/competitions/**", "/api/v1/teams/**", "/api/v1/games/**").authenticated()
                        .requestMatchers(HttpMethod.GET, "/api/v1/athletes/**", "/api/v1/coordinators/**").authenticated()
                        .requestMatchers(HttpMethod.GET, "/api/v1/campuses/**", "/api/v1/courses/**", "/api/v1/sports/**").authenticated()
                        .requestMatchers(HttpMethod.GET, "/api/v1/designated-coaches/**").authenticated()
                        .requestMatchers(HttpMethod.GET, "/api/v1/me/**").authenticated()

                        // =================================================================
                        // 3. ENDPOINTS DE AÇÕES PARA ATLETAS
                        // =================================================================
                        // ATUALIZADO: Inclui /api/v1/ nos caminhos
                        .requestMatchers(HttpMethod.GET, "/api/v1/dashboard/athlete").hasRole(ROLE_ATHLETE)
                        .requestMatchers(HttpMethod.POST, "/api/v1/teams").hasRole(ROLE_ATHLETE)
                        .requestMatchers(HttpMethod.PUT, "/api/v1/teams/{id}").hasRole(ROLE_ATHLETE)
                        .requestMatchers("/api/v1/teams/{id}/athletes/**").hasRole(ROLE_ATHLETE)

                        // =================================================================
                        // 4. ENDPOINTS DE ADMINISTRAÇÃO PARA COORDENADORES
                        // =================================================================
                        // ATUALIZADO: Inclui /api/v1/ nos caminhos
                        .requestMatchers(HttpMethod.GET, "/api/v1/dashboard/coordinator").hasRole(ROLE_COORDINATOR)
                        .requestMatchers("/api/v1/competitions/**").hasRole(ROLE_COORDINATOR)
                        .requestMatchers("/api/v1/games/**").hasRole(ROLE_COORDINATOR)
                        .requestMatchers(HttpMethod.DELETE, "/api/v1/teams/{id}").hasRole(ROLE_COORDINATOR)
                        .requestMatchers(HttpMethod.PUT, "/api/v1/athletes/{id}").hasAnyRole(ROLE_ATHLETE, ROLE_COORDINATOR)
                        .requestMatchers("/api/v1/athletes/**").hasRole(ROLE_COORDINATOR)
                        .requestMatchers("/api/v1/coordinators/**").hasRole(ROLE_COORDINATOR)
                        .requestMatchers("/api/v1/campuses/**", "/api/v1/courses/**", "/api/v1/sports/**").hasRole(ROLE_COORDINATOR)
                        .requestMatchers("/api/v1/designated-coaches/**").hasRole(ROLE_COORDINATOR)

                        // =================================================================
                        // 5. REGRA FINAL (fallback)
                        // =================================================================
                        .anyRequest().denyAll()
                )
                .addFilterBefore(securityFilter, UsernamePasswordAuthenticationFilter.class)
                .build();
    }

    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration configuration = new CorsConfiguration();
        configuration.setAllowedOrigins(Arrays.asList("http://localhost:8000", "http://localhost:3000", "http://127.0.0.1:8000")); // Adicione aqui as portas que o seu Flutter Web usa
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