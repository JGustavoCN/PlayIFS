// Ficheiro: lib/domain/usecases/sport/find_all_sports_use_case.dart

import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/shared/page.dart';
import 'package:playifs_frontend/domain/entities/sport/sport_summary.dart';
import 'package:playifs_frontend/domain/repositories/sport_repository.dart';

/// Caso de uso para buscar uma lista paginada de desportos.
class FindAllSportsUseCase {
  /// Construtor que recebe a abstração do repositório.
  const FindAllSportsUseCase(this._repository);

  final SportRepository _repository;

  /// Executa o caso de uso.
  Future<Result<Page<SportSummary>>> execute({
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