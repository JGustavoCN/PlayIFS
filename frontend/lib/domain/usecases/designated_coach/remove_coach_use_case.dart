// Ficheiro: lib/domain/usecases/designated_coach/remove_coach_use_case.dart

import 'package:playifs_frontend/core/network/result.dart';
// ✅ CORREÇÃO: Importa a entidade de input para a remoção.
import 'package:playifs_frontend/domain/entities/designated_coach/remove_coach_input.dart';
import 'package:playifs_frontend/domain/repositories/designated_coach_repository.dart';

class RemoveCoachUseCase {
  const RemoveCoachUseCase(this._repository);
  final DesignatedCoachRepository _repository;

  // ✅ CORREÇÃO: O parâmetro agora é 'RemoveCoachInput', conforme a API.
  Future<Result<void>> execute(RemoveCoachInput input) =>
      _repository.removeCoach(input);
}