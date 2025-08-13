// Ficheiro: lib/data/repositories/profile_repository_impl.dart

import 'package:dio/dio.dart';
import '../../core/network/result.dart';
import '../../domain/entities/user/profile.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/playifs_api_service.dart';
// ADICIONAR O IMPORT DOS MAPEADORES
import '../mappers/profile_mappers.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  // CORREÇÃO DE ESTILO: Construtor antes das variáveis.
  ProfileRepositoryImpl(this._apiService);

  final PlayifsApiService _apiService;

  @override
  Future<Result<Profile>> getProfile() async {
    try {
      final response = await _apiService.getMyProfile();
      // O método .toEntity() agora será encontrado graças ao import.
      final profileEntity = response.data.toEntity();
      return Result.success(profileEntity);
    } on DioException catch (e) {
      return Result.failure('Falha ao buscar perfil.', error: e);
    }
  }
}