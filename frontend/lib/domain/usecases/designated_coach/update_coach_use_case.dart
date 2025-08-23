// Ficheiro: lib/domain/usecases/designated_coach/update_coach_use_case.dart

import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/designated_coach/designated_coach_details.dart';
import 'package:playifs_frontend/domain/entities/designated_coach/designated_coach_input.dart';
import 'package:playifs_frontend/domain/repositories/designated_coach_repository.dart';

class UpdateCoachUseCase {
  const UpdateCoachUseCase(this._repository);
  final DesignatedCoachRepository _repository;

  Future<Result<DesignatedCoachDetails>> execute(DesignatedCoachInput input) =>
      _repository.updateCoach(input);
}