// Ficheiro: lib/domain/repositories/sport_repository.dart

import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/shared/page.dart';
import 'package:playifs_frontend/domain/entities/sport/sport_summary.dart';

/// Contrato para a fonte de dados de Desportos.
abstract class SportRepository {
  /// Retorna uma página de sumários de desportos, aceitando filtros e ordenação.
  Future<Result<Page<SportSummary>>> findAll({
    int page = 0,
    int size = 10,
    String? sort,
    Map<String, dynamic>? filters,
  });
}