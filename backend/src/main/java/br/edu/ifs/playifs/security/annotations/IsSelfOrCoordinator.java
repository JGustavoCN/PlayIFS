package br.edu.ifs.playifs.security.annotations;

import org.springframework.security.access.prepost.PreAuthorize;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * Anotação que permite o acesso se o usuário for o próprio atleta
 * (verificado pelo ID) OU se tiver a role de COORDENADOR.
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@PreAuthorize("hasRole('COORDINATOR') or @athleteService.isCurrentUser(#id, authentication.principal)")
public @interface IsSelfOrCoordinator {}