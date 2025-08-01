package br.edu.ifs.playifs.security;

import br.edu.ifs.playifs.config.SecurityConstants;
import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTCreationException;
import com.auth0.jwt.exceptions.JWTVerificationException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.GrantedAuthority; // Importar GrantedAuthority
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.stream.Collectors; // Importar Collectors

import static br.edu.ifs.playifs.config.SecurityConstants.ACCESS_TOKEN_EXPIRATION_HOURS;

@Service
public class TokenService {
    @Value("${api.security.token.secret}")
    private String secret;

    public String generateToken(UserDetails user){
        try{
            Algorithm algorithm = Algorithm.HMAC256(secret);

            // Coleta as roles do usuário como uma lista de Strings
            // O método getAuthority() de GrantedAuthority retorna a string da role (ex: "ROLE_ATHLETE")
            java.util.List<String> roles = user.getAuthorities().stream()
                    .map(GrantedAuthority::getAuthority)
                    .collect(Collectors.toList());

            return JWT.create()
                    .withIssuer(SecurityConstants.TOKEN_ISSUER)
                    .withSubject(user.getUsername()) // user.getUsername() retorna a matrícula
                    .withClaim("roles", roles) // Adiciona as roles como uma claim "roles" no payload
                    .withExpiresAt(genExpirationDate())
                    .sign(algorithm);
        } catch (JWTCreationException exception) {
            throw new RuntimeException("Erro ao gerar token", exception);
        }
    }

    public String validateToken(String token){
        try {
            Algorithm algorithm = Algorithm.HMAC256(secret);
            return JWT.require(algorithm)
                    .withIssuer(SecurityConstants.TOKEN_ISSUER)
                    .build()
                    .verify(token)
                    .getSubject();
        } catch (JWTVerificationException exception){
            return "";
        }
    }

    private Instant genExpirationDate(){
        return LocalDateTime.now().plusHours(ACCESS_TOKEN_EXPIRATION_HOURS).toInstant(ZoneOffset.of("-03:00"));
    }
}