package br.edu.ifs.playifs.security.annotations;

import org.springframework.security.access.prepost.PreAuthorize;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * Anotação de segurança que verifica se o usuário autenticado é um ATLETA
 * e também é o técnico (coach) da equipa especificada pelo ID no path da URL.
 * O ID da equipa deve ser um @PathVariable chamado "id".
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@PreAuthorize("hasRole('ATHLETE') and @teamService.isCoachOfTeam(authentication.principal, #id)")
public @interface IsTeamCoach {
}