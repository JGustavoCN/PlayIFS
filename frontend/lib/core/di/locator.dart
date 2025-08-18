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
import '../../data/repositories/config_repository_impl.dart'; // ✅ 1. Importar a implementação
import '../../data/repositories/course_repository_impl.dart';
import '../../data/repositories/sport_repository_impl.dart';
import '../../domain/repositories/campus_repository.dart';
import '../../domain/repositories/config_repository.dart'; // ✅ 2. Importar o contrato
import '../../domain/repositories/course_repository.dart';
import '../../domain/repositories/sport_repository.dart';
import '../../domain/usecases/campus/find_all_campuses_use_case.dart';
import '../../domain/usecases/config/get_app_config_use_case.dart';
import '../../domain/usecases/course/find_all_courses_use_case.dart';
import '../../domain/usecases/sport/find_all_sports_use_case.dart';

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
  // ✅ 3. Adicionar o registo do ConfigRepository que faltava
  locator.registerLazySingleton<ConfigRepository>(() => ConfigRepositoryImpl(locator()));
  locator.registerLazySingleton<SportRepository>(() => SportRepositoryImpl(locator()));
  locator.registerLazySingleton<CampusRepository>(() => CampusRepositoryImpl(locator()));
  locator.registerLazySingleton<CourseRepository>(() => CourseRepositoryImpl(locator()));

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
}