/// Contains all the API endpoints constants for the application.
class ApiConstants {
  // This class is not meant to be instantiated.
  ApiConstants._();

  // URL Base
  static const String baseUrl = 'http://localhost:8080/api/v1';

  // 0. Autenticação
  static const String authLogin = '/auth/login';
  static const String authRefreshToken = '/auth/refresh-token';

  // 1. Perfil e Configurações
  static const String me = '/me';
  static const String config = '/config';

  // 2. Atletas
  static const String athletes = '/athletes';
  static const String athleteById = '/athletes/{id}';
  static const String athletesBatchCreate = '/athletes/batch-create';
  static const String athletesBatchDelete = '/athletes/batch-delete';

  // 3. Competições
  static const String competitions = '/competitions';
  static const String competitionById = '/competitions/{id}';
  static const String competitionsBatchDelete = '/competitions/batch-delete';

  // 3.1. Fases da Competição (NOVOS)
  static const String generateGroups = '/competitions/{competitionId}/sports/{sportId}/generate-groups';
  static const String generateElimination = '/competitions/{competitionId}/sports/{sportId}/generate-elimination';
  static const String groupStage = '/competitions/{competitionId}/sports/{sportId}/group-stage';
  static const String eliminationBracket = '/competitions/{competitionId}/sports/{sportId}/elimination-bracket';

  // 4. Equipas (Teams)
  static const String teams = '/teams';
  static const String teamById = '/teams/{id}';
  static const String teamsBatchDelete = '/teams/batch-delete';
  static const String teamAthletesBatchAdd = '/teams/{id}/athletes/batch-add';
  static const String teamAthletesBatchRemove = '/teams/{id}/athletes/batch-remove';
  static const String teamAthleteById = '/teams/{id}/athletes/{athleteId}';

  // 5. Técnicos Designados
  static const String designatedCoaches = '/designated-coaches';
  static const String designatedCoachById = '/designated-coaches/{id}';
  static const String designatedCoachesBatchUpsert = '/designated-coaches/batch-upsert';
  static const String designatedCoachesBatchRemove = '/designated-coaches/batch-remove';

  static const String games = '/games';
  static const String gameById = '$games/{id}';
  static const String gameResult = '$games/{id}/result';
  static const String gameWo = '$games/{id}/wo';
  static const String gameUndoWo = '$games/{id}/undo-wo';
  static const String gameBatchDelete = '$games/batch-delete';
  static const String gameBatchReschedule = '$games/datetime/batch-update';
  static const String gameBatchResults = '$games/results/batch-update';

  // 6. Dados de Administração (Campi, Cursos, Desportos)
  static const String campuses = '/campuses';
  static const String courses = '/courses';
  static const String sports = '/sports';
}