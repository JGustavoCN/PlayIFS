package br.edu.ifs.playifs.security.annotations;

import br.edu.ifs.playifs.config.SecurityConstants;
import org.springframework.security.access.prepost.PreAuthorize;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * Anotação de atalho para verificar se o usuário autenticado tem a role de COORDENADOR.
 * Combina a segurança do @PreAuthorize com a clareza de uma anotação semântica
 * e a manutenibilidade de usar a constante de role centralizada.
 */
@Target({ElementType.METHOD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@PreAuthorize("hasRole('" + SecurityConstants.ROLE_COORDINATOR + "')")
public @interface IsCoordinator {
}