package br.edu.ifs.playifs.config;

import br.edu.ifs.playifs.competition.CompetitionRepository;
import br.edu.ifs.playifs.competition.DesignatedCoachRepository;
import br.edu.ifs.playifs.competition.model.Competition;
import br.edu.ifs.playifs.competition.model.DesignatedCoach;
import br.edu.ifs.playifs.data.campus.CampusRepository;
import br.edu.ifs.playifs.data.campus.model.Campus;
import br.edu.ifs.playifs.data.course.CourseRepository;
import br.edu.ifs.playifs.data.course.model.Course;
import br.edu.ifs.playifs.data.course.model.enums.CourseLevel;
import br.edu.ifs.playifs.data.sport.SportRepository;
import br.edu.ifs.playifs.data.sport.model.Sport;
import br.edu.ifs.playifs.team.TeamRepository;
import br.edu.ifs.playifs.team.model.Team;
import br.edu.ifs.playifs.user.model.Athlete;
import br.edu.ifs.playifs.user.model.Coordinator;
import br.edu.ifs.playifs.user.model.Role;
import br.edu.ifs.playifs.user.model.User;
import br.edu.ifs.playifs.user.repository.AthleteRepository;
import br.edu.ifs.playifs.user.repository.CoordinatorRepository;
import br.edu.ifs.playifs.user.repository.RoleRepository;
import br.edu.ifs.playifs.user.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;

@Configuration
@Profile("test")
public class TestSeeding implements CommandLineRunner {

    // --- INJEÇÃO DE DEPENDÊNCIAS ---
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
        createBaseInfrastructure(); // Cria os dados comuns a todos os cenários

        // --- Escolha o cenário de teste ---

        // Cenário 1: Padrão (2 equipas de futsal, 1 de vôlei)
        //createDefaultCompetitionScenario();

        // Cenário 2: Torneio de 9 equipas de Futsal
        // Para usar, comente a linha acima e descomente a linha abaixo.
         create9TeamFutsalTournamentScenario();
    }

    private void cleanDatabase() {
        // ... (código existente, está correto)
    }

    /**
     * Cria a infraestrutura base que é comum a todos os cenários de teste:
     * - Permissões (Roles)
     * - Usuários (Coordenador e 45 Atletas)
     * - Campus, Esportes e uma Competição principal.
     */
    private void createBaseInfrastructure() {
        // Criar Roles
        Role roleAthlete = new Role(null, "ROLE_ATHLETE");
        Role roleCoordinator = new Role(null, "ROLE_COORDINATOR");
        roleRepository.saveAll(Arrays.asList(roleAthlete, roleCoordinator));

        // Criar Coordenador
        User userCoord1 = new User(null, "coord01", passwordEncoder.encode("123456"), null, null, new HashSet<>());
        userCoord1.getRoles().add(roleCoordinator);
        userRepository.save(userCoord1);
        Coordinator coord1 = new Coordinator(null, "Prof. Nelio Alves", "nelio@ifs.edu.br", userCoord1);
        coordinatorRepository.save(coord1);

        // Criar 45 Atletas (suficiente para o cenário de 9 equipas de futsal)
        for (int i = 1; i <= 45; i++) {
            User user = new User(null, "2023" + String.format("%02d", i), passwordEncoder.encode("pass123"), null, null, new HashSet<>());
            user.getRoles().add(roleAthlete);
            userRepository.save(user);
            Athlete athlete = new Athlete(null, "Atleta " + i, "Apelido" + i, "9999999" + i, "atleta"+i+"@email.com", new HashSet<>(), user);
            athleteRepository.save(athlete);
        }

        // Criar Dados Base da Competição
        Campus c1 = new Campus();
        c1.setName("Campus Aracaju");
        campusRepository.save(c1);

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
    }

    /**
     * Cria o cenário de teste padrão, com 3 cursos e 3 equipas em desportos diferentes.
     */
    private void createDefaultCompetitionScenario() {
        // Busca os dados básicos que já foram criados
        Campus c1 = campusRepository.findAll().get(0);
        Competition comp1 = competitionRepository.findAll().get(0);
        Sport futsal = sportRepository.findById(1L).get();
        Sport voleibol = sportRepository.findById(2L).get();
        List<Athlete> athletes = athleteRepository.findAll();

        // Cria os cursos específicos para este cenário
        Course co1 = new Course();
        co1.setName("Informática");
        co1.setLevel(CourseLevel.INTEGRADO);
        co1.setCampus(c1);

        Course co2 = new Course();
        co2.setName("Edificações");
        co2.setLevel(CourseLevel.INTEGRADO);
        co2.setCampus(c1);
        courseRepository.saveAll(Arrays.asList(co1, co2));

        // Designa os técnicos
        DesignatedCoach dc1 = new DesignatedCoach(null, comp1, futsal, co1, athletes.get(0));
        DesignatedCoach dc2 = new DesignatedCoach(null, comp1, futsal, co2, athletes.get(5));
        DesignatedCoach dc3 = new DesignatedCoach(null, comp1, voleibol, co1, athletes.get(1));
        designatedCoachRepository.saveAll(Arrays.asList(dc1, dc2, dc3));

        // Cria as equipas
        Team t1 = new Team();
        t1.setName("Info Futsal PRO");
        t1.setCourse(co1);
        t1.setSport(futsal);
        t1.setCompetition(comp1);
        t1.setCoach(athletes.get(0));
        t1.getAthletes().addAll(Arrays.asList(athletes.get(0), athletes.get(1), athletes.get(2), athletes.get(3), athletes.get(10)));

        Team t2 = new Team();
        t2.setName("Edificações FC");
        t2.setCourse(co2);
        t2.setSport(futsal);
        t2.setCompetition(comp1);
        t2.setCoach(athletes.get(5));
        t2.getAthletes().addAll(Arrays.asList(athletes.get(5), athletes.get(6), athletes.get(7), athletes.get(8), athletes.get(9)));

        Team t3 = new Team();
        t3.setName("Info Volei");
        t3.setCourse(co1);
        t3.setSport(voleibol);
        t3.setCompetition(comp1);
        t3.setCoach(athletes.get(1));
        t3.getAthletes().addAll(Arrays.asList(athletes.get(1), athletes.get(2), athletes.get(3), athletes.get(4), athletes.get(11), athletes.get(12)));

        teamRepository.saveAll(Arrays.asList(t1, t2, t3));
    }

    /**
     * Cria o cenário de teste específico para um torneio de Futsal com 9 equipas.
     */
    private void create9TeamFutsalTournamentScenario() {
        // Busca dados básicos
        Campus c1 = campusRepository.findAll().get(0);
        Competition comp1 = competitionRepository.findAll().get(0);
        Sport futsal = sportRepository.findById(1L).get();
        List<Athlete> athletes = athleteRepository.findAll();

        // Cria 9 cursos para garantir a unicidade
        List<Course> courses = new ArrayList<>();
        for (int i = 1; i <= 9; i++) {
            Course course = new Course();
            course.setName("Curso Futsal " + i);
            course.setLevel(CourseLevel.INTEGRADO);
            course.setCampus(c1);
            courses.add(course);
        }
        courseRepository.saveAll(courses);

        // Cria e inscreve 9 equipas de Futsal, uma para cada curso, com atletas únicos
        int athleteCounter = 0;
        for (int i = 0; i < 9; i++) {
            Team team = new Team();
            team.setName("Equipa de Futsal " + (i + 1));
            team.setCourse(courses.get(i));
            team.setSport(futsal);
            team.setCompetition(comp1);

            Athlete coach = athletes.get(athleteCounter);
            team.setCoach(coach);

            List<Athlete> teamMembers = new ArrayList<>();
            for(int j=0; j<5; j++) {
                teamMembers.add(athletes.get(athleteCounter++));
            }
            team.getAthletes().addAll(teamMembers);

            teamRepository.save(team);
        }
    }
}