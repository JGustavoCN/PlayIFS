package br.edu.ifs.playifs.user.profile;

import br.edu.ifs.playifs.config.SecurityConstants;
import br.edu.ifs.playifs.security.annotations.IsAuthenticated;
import br.edu.ifs.playifs.shared.web.dto.ApiResponseBody;
import br.edu.ifs.playifs.user.athlete.AthleteController;
import br.edu.ifs.playifs.user.coordinator.CoordinatorController;
import br.edu.ifs.playifs.user.dto.ProfileDTO;
import br.edu.ifs.playifs.user.model.User;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

@RestController
@RequestMapping("/api/v1/me")
@Tag(name = "6. Gestão de Perfis", description = "Endpoints relacionados a perfis de usuário.")
@SecurityRequirement(name = SecurityConstants.SECURITY_SCHEME_NAME)
public class ProfileController {

    @Autowired
    private ProfileService service;

    @GetMapping
    @Operation(summary = "Busca os dados do perfil do usuário logado", description = "Retorna um objeto unificado com os detalhes do perfil (Atleta e/ou Coordenador) do usuário autenticado.")
    @IsAuthenticated
    public ResponseEntity<ApiResponseBody<ProfileDTO>> getMyProfile(@AuthenticationPrincipal User loggedUser) {
        ProfileDTO profile = service.getLoggedUserProfile(loggedUser);

        // Adiciona link para o próprio perfil
        profile.add(linkTo(methodOn(ProfileController.class).getMyProfile(loggedUser)).withSelfRel());

        // Se houver um perfil de atleta, adiciona um link para ele
        if (profile.getAthleteProfile() != null) {
            profile.getAthleteProfile().add(
                    linkTo(methodOn(AthleteController.class)
                            .findById(profile.getAthleteProfile().getId())).withSelfRel());
        }

        // Se houver um perfil de coordenador, adiciona um link para ele
        if (profile.getCoordinatorProfile() != null) {
            profile.getCoordinatorProfile().add(
                    linkTo(methodOn(CoordinatorController.class)
                            .findById(profile.getCoordinatorProfile().getId())).withSelfRel());
        }

        return ResponseEntity.ok(new ApiResponseBody<>(profile));
    }
}