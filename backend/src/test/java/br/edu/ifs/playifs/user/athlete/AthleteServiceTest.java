package br.edu.ifs.playifs.user.athlete;

import br.edu.ifs.playifs.shared.exceptions.ResourceNotFoundException;
import br.edu.ifs.playifs.team.TeamRepository;
import br.edu.ifs.playifs.user.dto.AthleteDetailsDTO;
import br.edu.ifs.playifs.user.model.Athlete;
import br.edu.ifs.playifs.user.model.User;
import br.edu.ifs.playifs.user.repository.AthleteRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.Collections;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.anyLong;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class AthleteServiceTest {

    @Mock
    private AthleteRepository athleteRepository;

    @Mock
    private TeamRepository teamRepository;

    @InjectMocks
    private AthleteService athleteService;

    private Athlete testAthlete;


    @BeforeEach
    void setUp() {
        User testUser = new User();
        testUser.setId(1L);
        testUser.setRegistration("202301");

        testAthlete = new Athlete();
        testAthlete.setId(1L);
        testAthlete.setFullName("José da Silva");
        testAthlete.setNickname("Zé");
        testAthlete.setEmail("jose.silva@email.com");
        testAthlete.setUser(testUser);
    }


    @Test
    @DisplayName("Deve retornar AthleteDetailsDTO quando o ID do atleta existir")
    void findById_shouldReturnAthleteDetailsDTO_whenIdExists() {

        when(athleteRepository.findById(1L)).thenReturn(Optional.of(testAthlete));


        when(teamRepository.findByCoach(testAthlete)).thenReturn(Collections.emptyList());

        AthleteDetailsDTO result = athleteService.findById(1L);

        assertNotNull(result);
        assertEquals(testAthlete.getId(), result.getId());
        assertEquals(testAthlete.getFullName(), result.getFullName());
        assertEquals(testAthlete.getUser().getRegistration(), result.getRegistration());
        assertFalse(result.isCoach());
    }

    @Test
    @DisplayName("Deve lançar ResourceNotFoundException quando o ID do atleta não existir")
    void findById_shouldThrowResourceNotFoundException_whenIdDoesNotExist() {
        when(athleteRepository.findById(anyLong())).thenReturn(Optional.empty());
        Exception exception = assertThrows(ResourceNotFoundException.class, () -> athleteService.findById(99L));

        String expectedMessage = "Atleta não encontrado com o ID: 99";
        String actualMessage = exception.getMessage();
        assertTrue(actualMessage.contains(expectedMessage));
    }
}