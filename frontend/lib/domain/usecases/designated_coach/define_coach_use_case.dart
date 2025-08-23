// Ficheiro: lib/domain/usecases/designated_coach/define_coach_use_case.dart

import 'package:playifs_frontend/core/network/result.dart';
// ✅ CORREÇÃO: Importa a entidade correta de detalhes.
import 'package:playifs_frontend/domain/entities/designated_coach/designated_coach_details.dart';
import 'package:playifs_frontend/domain/entities/designated_coach/designated_coach_input.dart';
import 'package:playifs_frontend/domain/repositories/designated_coach_repository.dart';

class DefineCoachUseCase {
  const DefineCoachUseCase(this._repository);
  final DesignatedCoachRepository _repository;

  // ✅ CORREÇÃO: O tipo de retorno agora é 'DesignatedCoachDetails'.
  Future<Result<DesignatedCoachDetails>> execute(DesignatedCoachInput input) =>
      _repository.defineCoach(input);
}