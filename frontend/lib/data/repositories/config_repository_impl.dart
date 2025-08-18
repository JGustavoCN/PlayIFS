// Ficheiro: lib/data/repositories/config_repository_impl.dart

import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/data/datasources/playifs_api_service.dart';
import 'package:playifs_frontend/data/mappers/config_mappers.dart';
import 'package:playifs_frontend/data/repositories/base_repository.dart';
import 'package:playifs_frontend/domain/entities/config/app_config.dart';
import 'package:playifs_frontend/domain/repositories/config_repository.dart';

class ConfigRepositoryImpl extends BaseRepository implements ConfigRepository {
  ConfigRepositoryImpl(this._apiService);

  final PlayifsApiService _apiService;

  @override
  Future<Result<AppConfig>> getAppConfig() => handleApiCall(() async {
    final response = await _apiService.getAppConfig();
    return response.data.toEntity();
  });
}