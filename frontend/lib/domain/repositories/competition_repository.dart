// Ficheiro: lib/domain/repositories/competition_repository.dart

import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/shared/page.dart';

import '../entities/competition/competition_details.dart';
import '../entities/competition/competition_input.dart';
import '../entities/competition/competition_summary.dart';

/// Contrato para a fonte de dados de Competições.
abstract class CompetitionRepository {
  /// Retorna uma página de sumários de competições.
  Future<Result<Page<CompetitionSummary>>> findAll({
    int page = 0,
    int size = 10,
    String? sort,
    Map<String, dynamic>? filters,
  });

  /// Retorna os detalhes completos de uma competição.
  Future<Result<CompetitionDetails>> findById(int id);

  /// Cria uma nova competição.
  Future<Result<CompetitionDetails>> insert(CompetitionInput competition);

  /// Atualiza uma competição existente.
  Future<Result<CompetitionDetails>> update(int id, CompetitionInput competition);

  /// Apaga uma competição.
  Future<Result<void>> delete(int id);

  /// Apaga competições em massa.
  Future<Result<void>> batchDelete(List<int> ids);
}