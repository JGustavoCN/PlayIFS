import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:playifs_frontend/core/network/dio_client.dart';
import 'package:playifs_frontend/data/datasources/playifs_api_service.dart';
import 'package:playifs_frontend/data/repositories/athlete_repository_impl.dart';
import 'package:playifs_frontend/data/repositories/auth_repository_impl.dart';
import 'package:playifs_frontend/data/repositories/profile_repository_impl.dart';
import 'package:playifs_frontend/data/services/token_storage_service.dart';
import 'package:playifs_frontend/domain/repositories/athlete_repository.dart';
import 'package:playifs_frontend/domain/repositories/auth_repository.dart';
import 'package:playifs_frontend/domain/repositories/profile_repository.dart';
import 'package:playifs_frontend/domain/usecases/athlete/batch_delete_athletes_use_case.dart';
import 'package:playifs_frontend/domain/usecases/athlete/batch_insert_athletes_use_case.dart';
import 'package:playifs_frontend/domain/usecases/athlete/delete_athlete_use_case.dart';
import 'package:playifs_frontend/domain/usecases/athlete/find_all_athletes_use_case.dart';
import 'package:playifs_frontend/domain/usecases/athlete/find_athlete_by_id_use_case.dart';
import 'package:playifs_frontend/domain/usecases/athlete/insert_athlete_use_case.dart';
import 'package:playifs_frontend/domain/usecases/athlete/update_athlete_use_case.dart';
import 'package:playifs_frontend/domain/usecases/auth/login_use_case.dart';
import 'package:playifs_frontend/domain/usecases/auth/refresh_token_use_case.dart';
import 'package:playifs_frontend/domain/usecases/profile/get_profile_use_case.dart';

import '../../data/repositories/campus_repository_impl.dart';
import '../../data/repositories/competition_repository_impl.dart';
import '../../data/repositories/config_repository_impl.dart'; // ✅ 1. Importar a implementação
import '../../data/repositories/course_repository_impl.dart';
import '../../data/repositories/designated_coach_repository_impl.dart';
import '../../data/repositories/sport_repository_impl.dart';
import '../../data/repositories/team_repository_impl.dart';
import '../../domain/repositories/campus_repository.dart';
import '../../domain/repositories/competition_repository.dart';
import '../../domain/repositories/config_repository.dart'; // ✅ 2. Importar o contrato
import '../../domain/repositories/course_repository.dart';
import '../../domain/repositories/designated_coach_repository.dart';
import '../../domain/repositories/sport_repository.dart';
import '../../domain/repositories/team_repository.dart';
import '../../domain/usecases/campus/find_all_campuses_use_case.dart';
import '../../domain/usecases/competition/batch_delete_competitions_use_case.dart';
import '../../domain/usecases/competition/delete_competition_use_case.dart';
import '../../domain/usecases/competition/find_all_competitions_use_case.dart';
import '../../domain/usecases/competition/find_competition_by_id_use_case.dart';
import '../../domain/usecases/competition/generate_elimination_stage_use_case.dart';
import '../../domain/usecases/competition/generate_group_stage_use_case.dart';
import '../../domain/usecases/competition/get_elimination_bracket_use_case.dart';
import '../../domain/usecases/competition/get_group_stage_view_use_case.dart';
import '../../domain/usecases/competition/insert_competition_use_case.dart';
import '../../domain/usecases/competition/update_competition_use_case.dart';
import '../../domain/usecases/config/get_app_config_use_case.dart';
import '../../domain/usecases/course/find_all_courses_use_case.dart';
import '../../domain/usecases/designated_coach/batch_remove_coaches_use_case.dart';
import '../../domain/usecases/designated_coach/batch_upsert_coaches_use_case.dart';
import '../../domain/usecases/designated_coach/define_coach_use_case.dart';
import '../../domain/usecases/designated_coach/find_all_designated_coaches_use_case.dart';
import '../../domain/usecases/designated_coach/find_designated_coach_by_id_use_case.dart';
import '../../domain/usecases/designated_coach/remove_coach_use_case.dart';
import '../../domain/usecases/designated_coach/update_coach_use_case.dart';
import '../../domain/usecases/sport/find_all_sports_use_case.dart';
import '../../domain/usecases/team/batch_add_athletes_use_case.dart';
import '../../domain/usecases/team/batch_delete_teams_use_case.dart';
import '../../domain/usecases/team/batch_remove_athletes_use_case.dart';
import '../../domain/usecases/team/delete_team_use_case.dart';
import '../../domain/usecases/team/find_all_teams_use_case.dart';
import '../../domain/usecases/team/find_team_by_id_use_case.dart';
import '../../domain/usecases/team/insert_team_use_case.dart';
import '../../domain/usecases/team/remove_athlete_from_team_use_case.dart';
import '../../domain/usecases/team/update_team_use_case.dart';

final locator = GetIt.instance;

void setupLocator() {
  // --- CAMADA DE REDE E SERVIÇOS DE BASE ---
  locator.registerLazySingleton<FlutterSecureStorage>(() => const FlutterSecureStorage());
  final configuredDio = DioClient(Dio(), locator<FlutterSecureStorage>()).dio;
  locator.registerSingleton<Dio>(configuredDio);
  locator.registerLazySingleton<PlayifsApiService>(() => PlayifsApiService(locator<Dio>()));
  locator.registerLazySingleton<TokenStorageService>(() => SecureTokenStorageService());

  // --- CAMADA DE DADOS: REPOSITÓRIOS ---
  locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(locator()));
  locator.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl(locator()));
  locator.registerLazySingleton<AthleteRepository>(() => AthleteRepositoryImpl(locator()));
  locator.registerLazySingleton<ConfigRepository>(() => ConfigRepositoryImpl(locator()));
  locator.registerLazySingleton<SportRepository>(() => SportRepositoryImpl(locator()));
  locator.registerLazySingleton<CampusRepository>(() => CampusRepositoryImpl(locator()));
  locator.registerLazySingleton<CourseRepository>(() => CourseRepositoryImpl(locator()));
  locator.registerLazySingleton<CompetitionRepository>(() => CompetitionRepositoryImpl(locator()));
  locator.registerLazySingleton<DesignatedCoachRepository>(() => DesignatedCoachRepositoryImpl(locator()));
  locator.registerLazySingleton<TeamRepository>(() => TeamRepositoryImpl(locator()));

  // --- CAMADA DE DOMÍNIO: CASOS DE USO ---
  // Auth & Profile
  locator.registerLazySingleton(() => LoginUseCase(locator()));
  locator.registerLazySingleton(() => RefreshTokenUseCase(locator()));
  locator.registerLazySingleton(() => GetProfileUseCase(locator()));

  // Atletas
  locator.registerLazySingleton(() => FindAllAthletesUseCase(locator()));
  locator.registerLazySingleton(() => FindAthleteByIdUseCase(locator()));
  locator.registerLazySingleton(() => InsertAthleteUseCase(locator()));
  locator.registerLazySingleton(() => UpdateAthleteUseCase(locator()));
  locator.registerLazySingleton(() => DeleteAthleteUseCase(locator()));
  locator.registerLazySingleton(() => BatchInsertAthletesUseCase(locator()));
  locator.registerLazySingleton(() => BatchDeleteAthletesUseCase(locator()));

  // Configuração
  locator.registerLazySingleton(() => GetAppConfigUseCase(locator()));

  // Dados Base
  locator.registerLazySingleton(() => FindAllSportsUseCase(locator()));
  locator.registerLazySingleton(() => FindAllCampusesUseCase(locator()));
  locator.registerLazySingleton(() => FindAllCoursesUseCase(locator()));

  //COMPETIÇÃO
  locator.registerLazySingleton(() => FindAllCompetitionsUseCase(locator()));
  locator.registerLazySingleton(() => FindCompetitionByIdUseCase(locator()));
  locator.registerLazySingleton(() => InsertCompetitionUseCase(locator()));
  locator.registerLazySingleton(() => UpdateCompetitionUseCase(locator()));
  locator.registerLazySingleton(() => DeleteCompetitionUseCase(locator()));
  locator.registerLazySingleton(() => BatchDeleteCompetitionsUseCase(locator()));

  locator.registerLazySingleton(() => GetGroupStageViewUseCase(locator()));
  locator.registerLazySingleton(() => GenerateGroupStageUseCase(locator()));
  locator.registerLazySingleton(() => GetEliminationBracketUseCase(locator()));
  locator.registerLazySingleton(() => GenerateEliminationStageUseCase(locator()));


  // ✅ ADICIONAR REGISTOS DOS CASOS DE USO DE TÉCNICOS DESIGNADOS
  locator.registerLazySingleton(() => FindAllDesignatedCoachesUseCase(locator()));
  locator.registerLazySingleton(() => FindDesignatedCoachByIdUseCase(locator()));
  locator.registerLazySingleton(() => DefineCoachUseCase(locator()));
  locator.registerLazySingleton(() => UpdateCoachUseCase(locator()));
  locator.registerLazySingleton(() => BatchUpsertCoachesUseCase(locator()));
  locator.registerLazySingleton(() => RemoveCoachUseCase(locator()));
  locator.registerLazySingleton(() => BatchRemoveCoachesUseCase(locator()));

  // Registra os Casos de Uso da funcionalidade de Equipas
  locator.registerLazySingleton(() => FindAllTeamsUseCase(locator()));
  locator.registerLazySingleton(() => FindTeamByIdUseCase(locator()));
  locator.registerLazySingleton(() => InsertTeamUseCase(locator()));
  locator.registerLazySingleton(() => UpdateTeamUseCase(locator()));
  locator.registerLazySingleton(() => DeleteTeamUseCase(locator()));
  locator.registerLazySingleton(() => BatchDeleteTeamsUseCase(locator()));
  locator.registerLazySingleton(() => BatchAddAthletesUseCase(locator()));
  locator.registerLazySingleton(() => BatchRemoveAthletesUseCase(locator()));
  locator.registerLazySingleton(() => RemoveAthleteFromTeamUseCase(locator()));


}