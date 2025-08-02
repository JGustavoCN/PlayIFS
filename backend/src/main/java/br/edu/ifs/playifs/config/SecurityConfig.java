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
@EnableMethodSecurity // Essencial para que as anotações @IsCoordinator, @IsAthlete, etc. funcionem
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
                        // 1. Endpoints Públicos (acessíveis sem autenticação)
                        .requestMatchers(
                                "/v3/api-docs/**",
                                "/swagger-ui/**",
                                "/h2-console/**"
                        ).permitAll()
                        .requestMatchers(HttpMethod.POST,
                                "/api/v1/auth/**",      // Login e Refresh Token
                                "/api/v1/athletes"      // Cadastro de novo atleta
                        ).permitAll()
                        .requestMatchers(HttpMethod.GET,
                                "/api/v1/reports/**",   // Relatórios
                                "/api/v1/config"        // Configurações de Enums
                        ).permitAll()

                        // 2. Ações de Coordenador (requerem ROLE_COORDINATOR)
                        // Qualquer método de escrita (POST, PUT, DELETE, etc.) para estes paths exige ser Coordenador.
                        .requestMatchers(
                                "/api/v1/competitions/**",
                                "/api/v1/campuses/**",
                                "/api/v1/courses/**",
                                "/api/v1/sports/**",
                                "/api/v1/games/**",
                                "/api/v1/designated-coaches/**",
                                "/api/v1/coordinators/**"
                        ).hasRole(ROLE_COORDINATOR)
                        .requestMatchers(HttpMethod.DELETE, "/api/v1/teams/**", "/api/v1/athletes/**").hasRole(ROLE_COORDINATOR)
                        .requestMatchers(HttpMethod.POST, "/api/v1/teams/batch-delete", "/api/v1/athletes/batch-create", "/api/v1/athletes/batch-delete").hasRole(ROLE_COORDINATOR)


                        // 3. Ações de Atleta (requerem ROLE_ATHLETE ou superior)
                        // Estas regras são verificadas após as de Coordenador.
                        .requestMatchers(HttpMethod.POST, "/api/v1/teams").hasRole(ROLE_ATHLETE)
                        .requestMatchers(HttpMethod.PUT, "/api/v1/teams/{id}").hasRole(ROLE_ATHLETE)
                        .requestMatchers("/api/v1/teams/{id}/athletes/**").hasRole(ROLE_ATHLETE)
                        .requestMatchers(HttpMethod.PUT, "/api/v1/athletes/{id}").hasAnyRole(ROLE_ATHLETE, ROLE_COORDINATOR) // A anotação @IsSelfOrCoordinator fará a verificação final

                        // 4. Regra Geral: Qualquer outra requisição precisa estar autenticada.
                        // Isto cobre todos os GETs de consulta (ex: GET /api/v1/teams) e os dashboards,
                        // que por sua vez terão a segurança refinada pelas anotações nos métodos.
                        .anyRequest().authenticated()
                )
                .addFilterBefore(securityFilter, UsernamePasswordAuthenticationFilter.class)
                .build();
    }

    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration configuration = new CorsConfiguration();
        configuration.setAllowedOrigins(Arrays.asList("http://localhost:8000", "http://localhost:3000", "http://127.0.0.1:8000"));
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