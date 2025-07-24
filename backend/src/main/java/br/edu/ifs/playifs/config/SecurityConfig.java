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

// Importar a nossa nova classe de constantes
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
                .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
                .authorizeHttpRequests(authorize -> authorize
                        // =================================================================
                        // 1. ENDPOINTS PÚBLICOS (não exigem token)
                        // =================================================================
                        .requestMatchers("/h2-console/**").permitAll()
                        .requestMatchers("/v3/api-docs/**", "/swagger-ui.html", "/swagger-ui/**").permitAll()
                        .requestMatchers(HttpMethod.POST, "/auth/login", "/auth/refresh-token").permitAll()
                        .requestMatchers(HttpMethod.POST, "/athletes").permitAll()
                        .requestMatchers(HttpMethod.GET, "/reports/**").permitAll()

                        // =================================================================
                        // 2. ENDPOINTS DE LEITURA (qualquer utilizador autenticado)
                        // =================================================================
                        .requestMatchers(HttpMethod.GET, "/competitions/**", "/teams/**", "/games/**").authenticated()
                        .requestMatchers(HttpMethod.GET, "/athletes/**", "/coordinators/**").authenticated()
                        .requestMatchers(HttpMethod.GET, "/campuses/**", "/courses/**", "/sports/**").authenticated()
                        .requestMatchers(HttpMethod.GET, "/designated-coaches/**").authenticated()

                        // =================================================================
                        // 3. ENDPOINTS DE AÇÕES PARA ATLETAS
                        // =================================================================
                        .requestMatchers(HttpMethod.GET, "/dashboard/athlete").hasRole(ROLE_ATHLETE)
                        .requestMatchers(HttpMethod.POST, "/teams").hasRole(ROLE_ATHLETE)
                        .requestMatchers(HttpMethod.PUT, "/teams/{id}").hasRole(ROLE_ATHLETE)
                        .requestMatchers("/teams/{id}/athletes/**").hasRole(ROLE_ATHLETE)

                        // =================================================================
                        // 4. ENDPOINTS DE ADMINISTRAÇÃO PARA COORDENADORES
                        // =================================================================
                        .requestMatchers(HttpMethod.GET, "/dashboard/coordinator").hasRole(ROLE_COORDINATOR)
                        .requestMatchers("/competitions/**").hasRole(ROLE_COORDINATOR)
                        .requestMatchers("/games/**").hasRole(ROLE_COORDINATOR)
                        .requestMatchers(HttpMethod.DELETE, "/teams/{id}").hasRole(ROLE_COORDINATOR)
                        .requestMatchers(HttpMethod.PUT, "/athletes/{id}").hasAnyRole(ROLE_ATHLETE, ROLE_COORDINATOR)
                        .requestMatchers("/athletes/**").hasRole(ROLE_COORDINATOR)
                        .requestMatchers("/coordinators/**").hasRole(ROLE_COORDINATOR)
                        .requestMatchers("/campuses/**", "/courses/**", "/sports/**").hasRole(ROLE_COORDINATOR)
                        .requestMatchers("/designated-coaches/**").hasRole(ROLE_COORDINATOR)

                        // =================================================================
                        // 5. REGRA FINAL (fallback)
                        // =================================================================
                        .anyRequest().denyAll()
                )
                .addFilterBefore(securityFilter, UsernamePasswordAuthenticationFilter.class)
                .build();
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