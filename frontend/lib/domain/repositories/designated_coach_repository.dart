// Ficheiro: lib/domain/repositories/designated_coach_repository.dart

import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/shared/page.dart';

import '../entities/designated_coach/designated_coach_details.dart';
import '../entities/designated_coach/designated_coach_input.dart';
import '../entities/designated_coach/designated_coach_input_batch.dart';
import '../entities/designated_coach/designated_coach_summary.dart';
import '../entities/designated_coach/remove_coach_input.dart';

/// Contrato para a fonte de dados de Técnicos Designados.
abstract class DesignatedCoachRepository {
  /// Retorna uma página de técnicos designados.
  Future<Result<Page<DesignatedCoachSummary>>> findAll({
    int page = 0,
    int size = 10,
    String? sort,
    Map<String, dynamic>? filters,
  });

  /// ✅ NOVO: Busca os detalhes de uma designação por ID.
  Future<Result<DesignatedCoachDetails>> findById(int id);

  /// ✅ CORRIGIDO: Retorna 'Details' em vez de 'Summary'.
  Future<Result<DesignatedCoachDetails>> defineCoach(DesignatedCoachInput input);

  /// ✅ NOVO: Adicionado método de atualização explícito.
  Future<Result<DesignatedCoachDetails>> updateCoach(DesignatedCoachInput input);

  /// ✅ CORRIGIDO: Retorna uma lista de 'Details' em vez de 'Summary'.
  Future<Result<List<DesignatedCoachDetails>>> batchUpsert(
      DesignatedCoachInputBatch batch);

  /// ✅ CORRIGIDO: Assinatura alterada para usar a chave composta.
  Future<Result<void>> removeCoach(RemoveCoachInput input);

  /// Remove um lote de designações por ID.
  Future<Result<void>> batchRemove(List<int> ids);
}