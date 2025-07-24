package br.edu.ifs.playifs.auth;

import br.edu.ifs.playifs.user.model.User;
import br.edu.ifs.playifs.user.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.UUID;

import static br.edu.ifs.playifs.config.SecurityConstants.REFRESH_TOKEN_EXPIRATION_DAYS;

@Service
public class RefreshTokenService {

    @Autowired
    private UserRepository userRepository;

    public String createRefreshToken(String username) {
        User user = (User) userRepository.findByRegistration(username);
        String token = UUID.randomUUID().toString();
        user.setRefreshToken(token);
        user.setRefreshTokenExpiryDate(Instant.now().plus(REFRESH_TOKEN_EXPIRATION_DAYS, ChronoUnit.DAYS));
        userRepository.save(user);
        return token;
    }

    // CORREÇÃO AQUI: O método agora retorna o tipo específico 'User'
    public User verifyExpiration(String token) {
        User user = userRepository.findByRefreshToken(token)
                .orElseThrow(() -> new RuntimeException("Refresh token is not in database!"));
        if (user.getRefreshTokenExpiryDate().compareTo(Instant.now()) < 0) {
            userRepository.delete(user);
            throw new RuntimeException("Refresh token was expired. Please make a new signin request");
        }
        return user;
    }
}