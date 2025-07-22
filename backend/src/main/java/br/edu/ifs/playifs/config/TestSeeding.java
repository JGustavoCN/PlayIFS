package br.edu.ifs.playifs.config;

import br.edu.ifs.playifs.entities.*;
import br.edu.ifs.playifs.entities.enums.CourseLevel;
import br.edu.ifs.playifs.repositories.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.ArrayList;

@Configuration
@Profile("test")
public class TestSeeding implements CommandLineRunner {

    @Autowired private TeamRepository teamRepository;
    @Autowired private DesignatedCoachRepository designatedCoachRepository;
    @Autowired private AthleteRepository athleteRepository;
    @Autowired private CoordinatorRepository coordinatorRepository;
    @Autowired private UserRepository userRepository;
    @Autowired private RoleRepository roleRepository;
    @Autowired private CompetitionRepository competitionRepository;
    @Autowired private CourseRepository courseRepository;
    @Autowired private SportRepository sportRepository;
    @Autowired private CampusRepository campusRepository;
    @Autowired private PasswordEncoder passwordEncoder;

    @Override
    @Transactional
    public void run(String... args) throws Exception {
        cleanDatabase();
        createRolesAndUsers();
        createCompetitionInfrastructureAndTeams();
    }

    private void cleanDatabase() {
        teamRepository.deleteAll();
        designatedCoachRepository.deleteAll();
        athleteRepository.deleteAll();
        coordinatorRepository.deleteAll();
        userRepository.deleteAll();
        roleRepository.deleteAll();
        competitionRepository.deleteAll();
        courseRepository.deleteAll();
        sportRepository.deleteAll();
        campusRepository.deleteAll();
    }

    private void createRolesAndUsers() {
        Role roleAthlete = new Role(null, "ROLE_ATHLETE");
        Role roleCoordinator = new Role(null, "ROLE_COORDINATOR");
        roleRepository.saveAll(Arrays.asList(roleAthlete, roleCoordinator));

        String coordinatorHashedPass = passwordEncoder.encode("123456");

        User userCoord1 = new User(null, "coord01", coordinatorHashedPass, null, null, new HashSet<>());
        userCoord1.getRoles().add(roleCoordinator);
        userRepository.save(userCoord1);
        Coordinator coord1 = new Coordinator(null, "Prof. Nelio Alves", "nelio@ifs.edu.br", userCoord1);
        coordinatorRepository.save(coord1);

        for (int i = 1; i <= 20; i++) {
            String registration = "2023" + String.format("%02d", i);
            User user = new User(null, registration, passwordEncoder.encode("pass123"), null, null, new HashSet<>());
            user.getRoles().add(roleAthlete);
            userRepository.save(user);
            String email = "atleta" + i + "@ifs.edu.br";
            Athlete athlete = new Athlete(null, "Atleta " + i, "Apelido" + i, "9999999" + i, email, new HashSet<>(), user);
            athleteRepository.save(athlete);
        }
    }

    private void createCompetitionInfrastructureAndTeams() {
        // --- USANDO SETTERS PARA EVITAR ERROS DE CONSTRUTOR ---

        Campus c1 = new Campus();
        c1.setName("Campus Aracaju");
        campusRepository.save(c1);

        Course co1 = new Course();
        co1.setName("Informática");
        co1.setLevel(CourseLevel.INTEGRADO);
        co1.setCampus(c1);

        Course co2 = new Course();
        co2.setName("Edificações");
        co2.setLevel(CourseLevel.INTEGRADO);
        co2.setCampus(c1);

        Course co3 = new Course();
        co3.setName("Física");
        co3.setLevel(CourseLevel.INTEGRADO);
        co3.setCampus(c1);
        courseRepository.saveAll(Arrays.asList(co1, co2, co3));

        Sport s1 = new Sport();
        s1.setName("Futsal");
        s1.setMinAthletes(5);
        s1.setMaxAthletes(10);

        Sport s2 = new Sport();
        s2.setName("Voleibol");
        s2.setMinAthletes(6);
        s2.setMaxAthletes(12);
        sportRepository.saveAll(Arrays.asList(s1, s2));

        Competition comp1 = new Competition();
        comp1.setName("Jogos do Integrado 2025");
        comp1.setLevel(CourseLevel.INTEGRADO);
        competitionRepository.save(comp1);

        // Buscar dados para associações
        List<Athlete> athletes = athleteRepository.findAll();

        // Designar os técnicos
        DesignatedCoach dc1 = new DesignatedCoach(null, comp1, s1, co1, athletes.get(0)); // Atleta 1 (ID 1) é técnico de Futsal/Info
        DesignatedCoach dc2 = new DesignatedCoach(null, comp1, s1, co2, athletes.get(5)); // Atleta 6 (ID 6) é técnico de Futsal/Edif
        designatedCoachRepository.saveAll(Arrays.asList(dc1, dc2));

        // Criar Equipa 1 (Info Futsal PRO)
        Team t1 = new Team();
        t1.setName("Info Futsal PRO");
        t1.setCourse(co1);
        t1.setSport(s1);
        t1.setCompetition(comp1);
        t1.setCoach(athletes.get(0)); // Atleta 1
        t1.getAthletes().addAll(Arrays.asList(athletes.get(0), athletes.get(1), athletes.get(2), athletes.get(3), athletes.get(4)));

        // Criar Equipa 2 (Edificações FC)
        Team t2 = new Team();
        t2.setName("Edificações FC");
        t2.setCourse(co2);
        t2.setSport(s1);
        t2.setCompetition(comp1);
        t2.setCoach(athletes.get(5)); // Atleta 6
        t2.getAthletes().addAll(Arrays.asList(athletes.get(5), athletes.get(6), athletes.get(7), athletes.get(8), athletes.get(9)));

        teamRepository.saveAll(Arrays.asList(t1, t2));
    }
}