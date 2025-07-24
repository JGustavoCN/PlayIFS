package br.edu.ifs.playifs.security.annotations;

import org.springframework.security.access.prepost.PreAuthorize;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * Anotação de segurança que permite o acesso a um recurso de equipa se o usuário
 * for o técnico da equipa OU se tiver a role de COORDENADOR.
 * O ID da equipa deve ser um @PathVariable chamado "id".
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@PreAuthorize("hasRole('ATHLETE') and @teamService.isCoachOfTeam(authentication.principal, #id) or hasRole('COORDINATOR')")
public @interface IsTeamCoachOrCoordinator {
}