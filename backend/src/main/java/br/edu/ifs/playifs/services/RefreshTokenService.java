package br.edu.ifs.playifs.services;

import br.edu.ifs.playifs.entities.User;
import br.edu.ifs.playifs.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.time.Instant;
import java.util.UUID;

@Service
public class RefreshTokenService {

    @Autowired
    private UserRepository userRepository;

    public String createRefreshToken(String username) {
        User user = (User) userRepository.findByRegistration(username);
        String token = UUID.randomUUID().toString();
        user.setRefreshToken(token);
        user.setRefreshTokenExpiryDate(Instant.now().plusMillis(604800000)); // 7 dias
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