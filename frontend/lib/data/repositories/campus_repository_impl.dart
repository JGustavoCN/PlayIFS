// Ficheiro: lib/data/repositories/campus_repository_impl.dart

import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/data/datasources/playifs_api_service.dart';
import 'package:playifs_frontend/data/mappers/campus_mappers.dart';
import 'package:playifs_frontend/data/mappers/page_mappers.dart';
import 'package:playifs_frontend/data/repositories/base_repository.dart';
import 'package:playifs_frontend/domain/entities/campus/campus_summary.dart';
import 'package:playifs_frontend/domain/entities/shared/page.dart';
import 'package:playifs_frontend/domain/repositories/campus_repository.dart';

class CampusRepositoryImpl extends BaseRepository implements CampusRepository {
  CampusRepositoryImpl(this._apiService);
  final PlayifsApiService _apiService;

  @override
  Future<Result<Page<CampusSummary>>> findAll({
    int page = 0,
    int size = 10,
    String? sort,
    Map<String, dynamic>? filters,
  }) {
    final queries = {'page': page, 'size': size, 'sort': sort, ...?filters};
    queries.removeWhere((key, value) => value == null);

    return handleApiCall(() async {
      final response = await _apiService.findAllCampuses(queries);
      // ✅ CORREÇÃO: Aplicando o padrão explícito.
      return response.data.toEntity<CampusSummary>((dto) => dto.toEntity());
    });
  }
}