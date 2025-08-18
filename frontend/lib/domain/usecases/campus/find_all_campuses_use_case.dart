// Ficheiro: lib/domain/usecases/campus/find_all_campuses_use_case.dart

import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/campus/campus_summary.dart';
import 'package:playifs_frontend/domain/entities/shared/page.dart';
import 'package:playifs_frontend/domain/repositories/campus_repository.dart';

/// Caso de uso para buscar uma lista paginada de campi.
class FindAllCampusesUseCase {
  /// Construtor que recebe a abstração do repositório.
  const FindAllCampusesUseCase(this._repository);

  final CampusRepository _repository;

  /// Executa o caso de uso.
  Future<Result<Page<CampusSummary>>> execute({
    int page = 0,
    int size = 10,
    String? sort,
    Map<String, dynamic>? filters,
  }) =>
      _repository.findAll(
        page: page,
        size: size,
        sort: sort,
        filters: filters,
      );
}