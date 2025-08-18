class ApiConstants {
  ApiConstants._();

  // URL Base
  static const String baseUrl = 'http://localhost:8080/api/v1';

  // 0. Autenticação
  static const String authLogin = '/auth/login';
  static const String authRefreshToken = '/auth/refresh-token';

  // 1. Dashboards
  static const String dashboardAthlete = '/dashboard/athlete';
  static const String dashboardCoordinator = '/dashboard/coordinator';

  // 2. Relatórios (BI)
  static const String reportsWoSummary = '/reports/wo-summary';
  static const String reportsTop3 = '/reports/top3';
  static const String reportsStatistics = '/reports/statistics';
  static const String reportsGroupStandings = '/reports/group-standings';
  static const String reportsCampaign = '/reports/campaign';

  // 3. Competições
  static const String competitions = '/competitions';
  static const String competitionById = '/competitions/{id}';
  static const String competitionsBatchDelete = '/competitions/batch-delete';
  static const String competitionGenerateGroups = '/competitions/{competitionId}/sports/{sportId}/generate-groups';
  static const String competitionGenerateElimination = '/competitions/{competitionId}/sports/{sportId}/generate-elimination';

  // 4. Equipas (Teams)
  static const String teams = '/teams';
  static const String teamById = '/teams/{id}';
  static const String teamsBatchDelete = '/teams/batch-delete';
  static const String teamAthletesBatchAdd = '/teams/{id}/athletes/batch-add';
  static const String teamAthletesBatchRemove = '/teams/{id}/athletes/batch-remove';
  static const String teamAthleteById = '/teams/{id}/athletes/{athleteId}'; // Para remover um atleta específico

  // 5. Jogos (Games)
  static const String games = '/games';
  static const String gameById = '/games/{id}';
  static const String gamesBatchDelete = '/games/batch-delete';
  static const String gameResult = '/games/{id}/result';
  static const String gamesResultsBatchUpdate = '/games/results/batch-update';
  static const String gamesDatetimeBatchUpdate = '/games/datetime/batch-update';
  static const String gameWo = '/games/{id}/wo';
  static const String gameUndoWo = '/games/{id}/undo-wo';

  // 6. Gestão de Perfis
  static const String me = '/me'; // Perfil do usuário logado

  // 6. Gestão de Perfis - Atletas
  static const String athletes = '/athletes';
  static const String athleteById = '/athletes/{id}';
  static const String athletesBatchCreate = '/athletes/batch-create';
  static const String athletesBatchDelete = '/athletes/batch-delete';

  // 6. Gestão de Perfis - Coordenadores
  static const String coordinators = '/coordinators';
  static const String coordinatorById = '/coordenators/{id}';

  // 7. Administração (Dados Base) - Campi
  static const String campuses = '/campuses';
  static const String campusById = '/campuses/{id}';
  static const String campusesBatchCreate = '/campuses/batch-create';
  static const String campusesBatchDelete = '/campuses/batch-delete';

  // 7. Administração (Dados Base) - Cursos
  static const String courses = '/courses';
  static const String courseById = '/courses/{id}';
  static const String coursesBatchCreate = '/courses/batch-create';
  static const String coursesBatchDelete = '/courses/batch-delete';

  // 7. Administração (Dados Base) - Desportos
  static const String sports = '/sports';
  static const String sportById = '/sports/{id}';
  static const String sportsBatchCreate = '/sports/batch-create';
  static const String sportsBatchDelete = '/sports/batch-delete';

  // 8. Técnicos Designados (Admin)
  static const String designatedCoaches = '/designated-coaches';
  static const String designatedCoachById = '/designated-coaches/{id}';
  static const String designatedCoachesBatchUpsert = '/designated-coaches/batch-upsert';
  static const String designatedCoachesBatchRemove = '/designated-coaches/batch-remove';

  // 9. Configuração da Aplicação
  static const String config = '/config';

}
