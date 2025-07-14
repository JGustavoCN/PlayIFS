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

@Configuration
@Profile("test")
public class TestSeeding implements CommandLineRunner {

    @Autowired private RoleRepository roleRepository;
    @Autowired private UserRepository userRepository;
    @Autowired private CoordinatorRepository coordinatorRepository;
    @Autowired private AthleteRepository athleteRepository;
    @Autowired private CampusRepository campusRepository;
    @Autowired private CourseRepository courseRepository;
    @Autowired private SportRepository sportRepository;
    @Autowired private CompetitionRepository competitionRepository;
    @Autowired private TeamRepository teamRepository;
    @Autowired private DesignatedCoachRepository designatedCoachRepository;
    @Autowired private PasswordEncoder passwordEncoder;

    @Override
    @Transactional
    public void run(String... args) throws Exception {

        // 1. LIMPEZA COMPLETA
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

        // 2. CRIAR ROLES
        Role roleAthlete = new Role(null, "ROLE_ATHLETE");
        Role roleCoordinator = new Role(null, "ROLE_COORDINATOR");
        roleRepository.saveAll(Arrays.asList(roleAthlete, roleCoordinator));

        // 3. CRIAR USUÁRIOS E PERFIS
        User userCoord1 = new User(null, "coord01", passwordEncoder.encode("123456"), new HashSet<>());
        userCoord1.getRoles().add(roleCoordinator);
        userRepository.save(userCoord1);
        Coordinator coord1 = new Coordinator(null, "Prof. Nelio Alves", "nelio@ifs.edu.br", userCoord1);
        coordinatorRepository.save(coord1);

        // --- ATLETAS ---
        User u1 = new User(null, "202301", passwordEncoder.encode("pass123"), new HashSet<>());
        User u2 = new User(null, "202302", passwordEncoder.encode("pass123"), new HashSet<>());
        User u3 = new User(null, "202303", passwordEncoder.encode("pass123"), new HashSet<>());
        User u4 = new User(null, "202304", passwordEncoder.encode("pass123"), new HashSet<>());
        User u5 = new User(null, "202305", passwordEncoder.encode("pass123"), new HashSet<>());
        User u6 = new User(null, "202306", passwordEncoder.encode("pass123"), new HashSet<>());
        User u7 = new User(null, "202307", passwordEncoder.encode("pass123"), new HashSet<>());
        User u8 = new User(null, "202308", passwordEncoder.encode("pass123"), new HashSet<>());
        User u9 = new User(null, "202309", passwordEncoder.encode("pass123"), new HashSet<>());
        User u10 = new User(null, "202310", passwordEncoder.encode("pass123"), new HashSet<>());
        User u11 = new User(null, "202311", passwordEncoder.encode("pass123"), new HashSet<>());
        User u12 = new User(null, "202312", passwordEncoder.encode("pass123"), new HashSet<>());
        List<User> users = Arrays.asList(u1, u2, u3, u4, u5, u6, u7, u8, u9, u10, u11, u12);
        users.forEach(u -> u.getRoles().add(roleAthlete));
        userRepository.saveAll(users);

        Athlete a1 = new Athlete(null, "João da Silva", "João", "79911111111", "joao@ifs.edu.br", new HashSet<>(), u1);
        Athlete a2 = new Athlete(null, "Maria Oliveira", "Maria", "79922222222", "maria@ifs.edu.br", new HashSet<>(), u2);
        Athlete a3 = new Athlete(null, "Carlos Pereira", "Carlinhos", "79933333333", "carlos@ifs.edu.br", new HashSet<>(), u3);
        Athlete a4 = new Athlete(null, "Pedro Martins", "Pedro", "79944444444", "pedro@ifs.edu.br", new HashSet<>(), u4);
        Athlete a5 = new Athlete(null, "Lucas Souza", "Lucas", "79955555555", "lucas@ifs.edu.br", new HashSet<>(), u5);
        Athlete a6 = new Athlete(null, "Ana Costa", "Ana", "79966666666", "ana@ifs.edu.br", new HashSet<>(), u6);
        Athlete a7 = new Athlete(null, "Mariana Santos", "Mari", "79977777777", "mariana@ifs.edu.br", new HashSet<>(), u7);
        Athlete a8 = new Athlete(null, "Fernanda Lima", "Fê", "79988888888", "fernanda@ifs.edu.br", new HashSet<>(), u8);
        Athlete a9 = new Athlete(null, "Ricardo Almeida", "Ricardo", "79999999999", "ricardo@ifs.edu.br", new HashSet<>(), u9);
        Athlete a10 = new Athlete(null, "Bruno Gomes", "Bruninho", "79910101010", "bruno@ifs.edu.br", new HashSet<>(), u10);
        Athlete a11 = new Athlete(null, "Juliana Rocha", "Ju", "79911111112", "juliana@ifs.edu.br", new HashSet<>(), u11);
        Athlete a12 = new Athlete(null, "Gabriel Ferreira", "Gabriel", "79912121212", "gabriel@ifs.edu.br", new HashSet<>(), u12);
        athleteRepository.saveAll(Arrays.asList(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12));

        // 4. DADOS DA COMPETIÇÃO
        Campus c1 = new Campus(null, "Campus Aracaju");
        campusRepository.save(c1);
        Course co1 = new Course(null, "Informática para Internet", CourseLevel.INTEGRADO, c1);
        Course co2 = new Course(null, "Edificações", CourseLevel.INTEGRADO, c1);
        courseRepository.saveAll(Arrays.asList(co1, co2));
        Sport s1 = new Sport(null, "Futsal", 5, 10);
        Sport s2 = new Sport(null, "Voleibol", 6, 12);
        sportRepository.saveAll(Arrays.asList(s1, s2));
        Competition comp1 = new Competition(null, "Jogos do Integrado 2025", CourseLevel.INTEGRADO, new HashSet<>());
        competitionRepository.save(comp1);

        // 5. EQUIPAS PRÉ-CADASTRADAS
        DesignatedCoach dc1 = new DesignatedCoach(null, comp1, s1, co1, a1);
        DesignatedCoach dc2 = new DesignatedCoach(null, comp1, s1, co2, a6);
        designatedCoachRepository.saveAll(Arrays.asList(dc1, dc2));

        Team t1 = new Team();
        t1.setName("Info Futsal PRO");
        t1.setCourse(co1);
        t1.setSport(s1);
        t1.setCompetition(comp1);
        t1.setCoach(a1);
        t1.getAthletes().addAll(Arrays.asList(a1, a2, a3, a4, a5));

        Team t2 = new Team();
        t2.setName("Edificações FC");
        t2.setCourse(co2);
        t2.setSport(s1);
        t2.setCompetition(comp1);
        t2.setCoach(a6);
        t2.getAthletes().addAll(Arrays.asList(a6, a7, a8, a9, a10));

        teamRepository.saveAll(Arrays.asList(t1, t2));
    }
}