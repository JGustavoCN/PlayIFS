// Ficheiro: lib/data/repositories/profile_repository_impl.dart

import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/data/datasources/playifs_api_service.dart';
import 'package:playifs_frontend/data/mappers/profile_mappers.dart';
import 'package:playifs_frontend/data/repositories/base_repository.dart';
import 'package:playifs_frontend/domain/entities/user/profile.dart';
import 'package:playifs_frontend/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl extends BaseRepository implements ProfileRepository {
  ProfileRepositoryImpl(this._apiService);

  final PlayifsApiService _apiService;

  @override
  Future<Result<Profile>> getProfile() => handleApiCall(() async {
    final response = await _apiService.getMyProfile();
    return response.data.toEntity();
  });
}