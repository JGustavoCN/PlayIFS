// Ficheiro: lib/core/di/locator.dart

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:playifs_frontend/core/network/dio_client.dart';
import 'package:playifs_frontend/data/datasources/playifs_api_service.dart';
import 'package:playifs_frontend/data/repositories/auth_repository_impl.dart';
import 'package:playifs_frontend/data/repositories/profile_repository_impl.dart';
import 'package:playifs_frontend/data/services/token_storage_service.dart';
import 'package:playifs_frontend/domain/repositories/auth_repository.dart';
import 'package:playifs_frontend/domain/repositories/profile_repository.dart';
import 'package:playifs_frontend/domain/usecases/auth/login_use_case.dart';
import 'package:playifs_frontend/domain/usecases/auth/refresh_token_use_case.dart';
import 'package:playifs_frontend/domain/usecases/profile/get_profile_use_case.dart';

final locator = GetIt.instance;

/// Regista todas as dependências (serviços, repositórios, casos de uso)
/// para que possam ser injetadas em outras partes da aplicação.
void setupLocator() {
  // --- CAMADA DE REDE E SERVIÇOS DE BASE ---

  // 1. Registamos as dependências base primeiro, que não dependem de nada.
  locator.registerLazySingleton<FlutterSecureStorage>(() => const FlutterSecureStorage());

  // 2. Criamos e configuramos a instância do Dio usando a nossa classe DioClient.
  //    O DioClient precisa de uma instância nova de Dio e do FlutterSecureStorage que já registámos.
  final configuredDio = DioClient(Dio(), locator<FlutterSecureStorage>()).dio;

  // 3. Registamos a instância do Dio JÁ CONFIGURADA como um singleton.
  //    É esta instância que o resto da aplicação (ex: ApiService) irá usar.
  locator.registerSingleton<Dio>(configuredDio);

  // 4. Registamos o nosso serviço de API Retrofit, que depende do Dio configurado.
  locator.registerLazySingleton<PlayifsApiService>(
        () => PlayifsApiService(locator<Dio>()),
  );

  // 5. Registamos o nosso serviço para armazenamento de tokens.
  locator.registerLazySingleton<TokenStorageService>(
        () => SecureTokenStorageService(),
  );


  // --- CAMADA DE DADOS: REPOSITÓRIOS ---
  // As implementações dos nossos contratos de domínio.
  locator.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(locator()),
  );

  locator.registerLazySingleton<ProfileRepository>(
        () => ProfileRepositoryImpl(locator()),
  );


  // --- CAMADA DE DOMÍNIO: CASOS DE USO ---
  // A nossa lógica de negócio. Eles dependem dos repositórios.
  locator.registerLazySingleton(() => LoginUseCase(locator()));
  locator.registerLazySingleton(() => RefreshTokenUseCase(locator()));
  locator.registerLazySingleton(() => GetProfileUseCase(locator()));
}