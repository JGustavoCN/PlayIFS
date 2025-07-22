package br.edu.ifs.playifs.controllers;

import br.edu.ifs.playifs.dto.LoginRequestDTO;
import br.edu.ifs.playifs.dto.LoginResponseDTO;
import br.edu.ifs.playifs.dto.RefreshTokenRequestDTO;
import br.edu.ifs.playifs.dto.RefreshTokenResponseDTO;
import br.edu.ifs.playifs.entities.User;
import br.edu.ifs.playifs.services.RefreshTokenService;
import br.edu.ifs.playifs.services.TokenService;
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
@RequestMapping("/login")
public class AuthenticationController {

    @Autowired private AuthenticationManager authenticationManager;
    @Autowired private TokenService tokenService;
    @Autowired private RefreshTokenService refreshTokenService;

    @PostMapping
    public ResponseEntity login(@RequestBody LoginRequestDTO data){
        var usernamePassword = new UsernamePasswordAuthenticationToken(data.registration(), data.password());
        var auth = this.authenticationManager.authenticate(usernamePassword);
        String accessToken = tokenService.generateToken((UserDetails) auth.getPrincipal());
        String refreshToken = refreshTokenService.createRefreshToken(auth.getName());
        return ResponseEntity.ok(new LoginResponseDTO(accessToken, refreshToken));
    }

    @PostMapping("/refresh-token")
    public ResponseEntity refreshToken(@RequestBody RefreshTokenRequestDTO request) {
        User user = refreshTokenService.verifyExpiration(request.refreshToken());
        String newAccessToken = tokenService.generateToken(user);
        String newRefreshToken = refreshTokenService.createRefreshToken(user.getUsername());
        return ResponseEntity.ok(new RefreshTokenResponseDTO(newAccessToken, newRefreshToken));
    }
}