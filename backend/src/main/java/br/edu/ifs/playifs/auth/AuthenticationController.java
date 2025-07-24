package br.edu.ifs.playifs.auth;

import br.edu.ifs.playifs.auth.dto.LoginRequestDTO;
import br.edu.ifs.playifs.auth.dto.LoginResponseDTO;
import br.edu.ifs.playifs.auth.dto.RefreshTokenRequestDTO;
import br.edu.ifs.playifs.auth.dto.RefreshTokenResponseDTO;
import br.edu.ifs.playifs.user.model.User;
import br.edu.ifs.playifs.security.TokenService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/auth")
@Tag(name = "0. Autenticação", description = "Endpoints para autenticação, autorização e gestão de tokens de acesso.")
public class AuthenticationController {

    @Autowired private AuthenticationManager authenticationManager;
    @Autowired private TokenService tokenService;
    @Autowired private RefreshTokenService refreshTokenService;

    @PostMapping("/login")
    @Operation(
            summary = "Realiza a autenticação do usuário",
            description = "Autentica um usuário com base na matrícula (registration) e senha, retornando um token de acesso (JWT) e um refresh token."
    )
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Autenticação bem-sucedida",
                    content = @Content(mediaType = "application/json",
                            schema = @Schema(implementation = LoginResponseDTO.class))),
            @ApiResponse(responseCode = "403", ref = "ForbiddenError")
    })
    public ResponseEntity<LoginResponseDTO> login(@RequestBody LoginRequestDTO data){
        var usernamePassword = new UsernamePasswordAuthenticationToken(data.registration(), data.password());
        var auth = this.authenticationManager.authenticate(usernamePassword);
        String accessToken = tokenService.generateToken((UserDetails) auth.getPrincipal());
        String refreshToken = refreshTokenService.createRefreshToken(auth.getName());
        return ResponseEntity.ok(new LoginResponseDTO(accessToken, refreshToken));
    }

    @PostMapping("/refresh-token")
    @Operation(
            summary = "Renova o token de acesso",
            description = "Gera um novo token de acesso e um novo refresh token a partir de um refresh token válido. O refresh token antigo é invalidado (rotação de token)."
    )
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Token de acesso renovado com sucesso",
                    content = @Content(mediaType = "application/json",
                            schema = @Schema(implementation = RefreshTokenResponseDTO.class))),
            @ApiResponse(responseCode = "403", ref = "ForbiddenError")
    })
    public ResponseEntity<RefreshTokenResponseDTO> refreshToken(@RequestBody RefreshTokenRequestDTO request) {
        User user = refreshTokenService.verifyExpiration(request.refreshToken());
        String newAccessToken = tokenService.generateToken(user);
        String newRefreshToken = refreshTokenService.createRefreshToken(user.getUsername());
        return ResponseEntity.ok(new RefreshTokenResponseDTO(newAccessToken, newRefreshToken));
    }
}