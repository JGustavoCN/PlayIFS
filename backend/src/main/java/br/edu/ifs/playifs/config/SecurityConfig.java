package br.edu.ifs.playifs.config;


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
                        .requestMatchers(HttpMethod.POST, "/login", "/login/refresh-token").permitAll()
                        .requestMatchers(HttpMethod.POST, "/athletes").permitAll() // Auto-registo de atletas
                        .requestMatchers(HttpMethod.GET, "/reports/**").permitAll() // Relatórios são públicos

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
                        .requestMatchers(HttpMethod.POST, "/teams").hasRole("ATHLETE")
                        .requestMatchers(HttpMethod.PUT, "/teams/{id}").hasRole("ATHLETE") // Atleta (capitão) edita sua equipa
                        .requestMatchers("/teams/{id}/athletes/**").hasRole("ATHLETE") // Atleta (capitão) gere sua equipa

                        // =================================================================
                        // 4. ENDPOINTS DE ADMINISTRAÇÃO PARA COORDENADORES
                        // =================================================================
                        // Gestão completa de competições
                        .requestMatchers("/competitions/**").hasRole("COORDINATOR")
                        // Gestão de resultados, agendamento e cancelamento de jogos
                        .requestMatchers("/games/**").hasRole("COORDINATOR")
                        // Gestão administrativa de equipas (ex: apagar)
                        .requestMatchers(HttpMethod.DELETE, "/teams/{id}").hasRole("COORDINATOR")
                        // Gestão de todos os perfis de utilizador
                        .requestMatchers("/athletes/**", "/coordinators/**").hasRole("COORDINATOR")
                        // Gestão de dados base do sistema
                        .requestMatchers("/campuses/**", "/courses/**", "/sports/**").hasRole("COORDINATOR")
                        // Gestão de técnicos designados
                        .requestMatchers("/designated-coaches/**").hasRole("COORDINATOR")

                        // =================================================================
                        // 5. REGRA FINAL (fallback)
                        // =================================================================
                        .anyRequest().denyAll() // Nega qualquer outra requisição não mapeada acima
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