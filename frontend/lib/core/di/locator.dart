// Ficheiro: lib/core/di/locator.dart

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:playifs_frontend/core/network/dio_client.dart';
import 'package:playifs_frontend/data/datasources/playifs_api_service.dart';
import 'package:playifs_frontend/data/repositories/athlete_repository_impl.dart'; // ✅ Importar
import 'package:playifs_frontend/data/repositories/auth_repository_impl.dart';
import 'package:playifs_frontend/data/repositories/profile_repository_impl.dart';
import 'package:playifs_frontend/data/services/token_storage_service.dart';
import 'package:playifs_frontend/domain/repositories/athlete_repository.dart'; // ✅ Importar
import 'package:playifs_frontend/domain/repositories/auth_repository.dart';
import 'package:playifs_frontend/domain/repositories/profile_repository.dart';
import 'package:playifs_frontend/domain/usecases/athlete/batch_delete_athletes_use_case.dart'; // ✅ Importar
import 'package:playifs_frontend/domain/usecases/athlete/batch_insert_athletes_use_case.dart'; // ✅ Importar
import 'package:playifs_frontend/domain/usecases/athlete/delete_athlete_use_case.dart'; // ✅ Importar
import 'package:playifs_frontend/domain/usecases/athlete/find_all_athletes_use_case.dart'; // ✅ Importar
import 'package:playifs_frontend/domain/usecases/athlete/find_athlete_by_id_use_case.dart'; // ✅ Importar
import 'package:playifs_frontend/domain/usecases/athlete/insert_athlete_use_case.dart'; // ✅ Importar
import 'package:playifs_frontend/domain/usecases/athlete/update_athlete_use_case.dart'; // ✅ Importar
import 'package:playifs_frontend/domain/usecases/auth/login_use_case.dart';
import 'package:playifs_frontend/domain/usecases/auth/refresh_token_use_case.dart';
import 'package:playifs_frontend/domain/usecases/profile/get_profile_use_case.dart';

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
  // ✅ Adicionar o repositório de Atletas
  locator.registerLazySingleton<AthleteRepository>(() => AthleteRepositoryImpl(locator()));

  // --- CAMADA DE DOMÍNIO: CASOS DE USO ---
  // Auth & Profile
  locator.registerLazySingleton(() => LoginUseCase(locator()));
  locator.registerLazySingleton(() => RefreshTokenUseCase(locator()));
  locator.registerLazySingleton(() => GetProfileUseCase(locator()));

  // ✅ Adicionar os casos de uso de Atletas
  locator.registerLazySingleton(() => FindAllAthletesUseCase(locator()));
  locator.registerLazySingleton(() => FindAthleteByIdUseCase(locator()));
  locator.registerLazySingleton(() => InsertAthleteUseCase(locator()));
  locator.registerLazySingleton(() => UpdateAthleteUseCase(locator()));
  locator.registerLazySingleton(() => DeleteAthleteUseCase(locator()));
  locator.registerLazySingleton(() => BatchInsertAthletesUseCase(locator()));
  locator.registerLazySingleton(() => BatchDeleteAthletesUseCase(locator()));
}