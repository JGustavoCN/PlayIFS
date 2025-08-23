// Ficheiro: lib/domain/usecases/designated_coach/batch_upsert_coaches_use_case.dart

import 'package:playifs_frontend/core/network/result.dart';
// ✅ CORREÇÃO: Importa a entidade correta de detalhes.
import 'package:playifs_frontend/domain/entities/designated_coach/designated_coach_details.dart';
import 'package:playifs_frontend/domain/entities/designated_coach/designated_coach_input_batch.dart';
import 'package:playifs_frontend/domain/repositories/designated_coach_repository.dart';

class BatchUpsertCoachesUseCase {
  const BatchUpsertCoachesUseCase(this._repository);
  final DesignatedCoachRepository _repository;

  // ✅ CORREÇÃO: O tipo de retorno agora é uma lista de 'DesignatedCoachDetails'.
  Future<Result<List<DesignatedCoachDetails>>> execute(
      DesignatedCoachInputBatch batch) =>
      _repository.batchUpsert(batch);
}