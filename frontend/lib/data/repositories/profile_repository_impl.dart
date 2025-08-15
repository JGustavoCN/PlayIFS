import 'package:dio/dio.dart';
import 'package:playifs_frontend/core/network/exceptions.dart';
import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/data/datasources/playifs_api_service.dart';
import 'package:playifs_frontend/data/mappers/profile_mappers.dart';
import 'package:playifs_frontend/domain/entities/user/profile.dart';
import 'package:playifs_frontend/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl(this._apiService);

  final PlayifsApiService _apiService;

  @override
  Future<Result<Profile>> getProfile() => _handleApiCall<Profile>(() async {
    final response = await _apiService.getMyProfile();
    return response.data.toEntity();
  });

  Future<Result<T>> _handleApiCall<T>(Future<T> Function() apiCall) async {
    try {
      return Result.success(await apiCall());
    } on DioException catch (e) {
      if (e.error is ValidationException) {
        return Result.failure(e.error as ValidationException);
      }
      final message =
          e.response?.data?['error'] ?? e.message ?? 'Erro desconhecido';
      return Result.failure(ApiException(
        message,
        statusCode: e.response?.statusCode,
      ));
    } catch (e) {
      return Result.failure(ApiException(e.toString()));
    }
  }
}