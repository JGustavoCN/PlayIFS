package br.edu.ifs.playifs.user.profile;

import br.edu.ifs.playifs.user.dto.AthleteDetailsDTO;
import br.edu.ifs.playifs.user.dto.CoordinatorDetailsDTO;
import br.edu.ifs.playifs.user.dto.ProfileDTO;
import br.edu.ifs.playifs.user.model.Athlete;
import br.edu.ifs.playifs.user.model.User;
import br.edu.ifs.playifs.user.repository.AthleteRepository;
import br.edu.ifs.playifs.user.repository.CoordinatorRepository;
import br.edu.ifs.playifs.user.athlete.AthleteService; // Importar AthleteService para usar isAthleteCoach
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ProfileService {

    @Autowired
    private AthleteRepository athleteRepository;

    @Autowired
    private CoordinatorRepository coordinatorRepository;

    @Autowired
    private AthleteService athleteService;

    @Transactional(readOnly = true)
    public ProfileDTO getLoggedUserProfile(User loggedUser) {
        AthleteDetailsDTO athleteProfile = null;
        CoordinatorDetailsDTO coordinatorProfile = null;

        var athleteOpt = athleteRepository.findByUser(loggedUser);
        if (athleteOpt.isPresent()) {
            Athlete athleteEntity = athleteOpt.get();
            boolean isCoach = athleteService.isAthleteCoach(athleteEntity); // Usar o método do AthleteService
            athleteProfile = new AthleteDetailsDTO(athleteEntity, isCoach); // Passar a flag isCoach para o construtor
        }

        var coordinatorOpt = coordinatorRepository.findByUser(loggedUser);
        if (coordinatorOpt.isPresent()) {
            coordinatorProfile = new CoordinatorDetailsDTO(coordinatorOpt.get());
        }

        return new ProfileDTO(loggedUser, athleteProfile, coordinatorProfile);
    }
}