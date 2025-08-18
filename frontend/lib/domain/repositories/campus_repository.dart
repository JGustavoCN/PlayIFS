// Ficheiro: lib/domain/repositories/campus_repository.dart

import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/campus/campus_summary.dart';
import 'package:playifs_frontend/domain/entities/shared/page.dart';

/// Contrato para a fonte de dados de Campi.
abstract class CampusRepository {
  /// Retorna uma página de sumários de campi, aceitando filtros e ordenação.
  Future<Result<Page<CampusSummary>>> findAll({
    int page = 0,
    int size = 10,
    String? sort,
    Map<String, dynamic>? filters,
  });
}