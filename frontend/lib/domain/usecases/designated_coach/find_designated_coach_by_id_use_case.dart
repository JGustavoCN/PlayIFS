// Ficheiro: lib/domain/usecases/designated_coach/find_designated_coach_by_id_use_case.dart

import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/designated_coach/designated_coach_details.dart';
import 'package:playifs_frontend/domain/repositories/designated_coach_repository.dart';

class FindDesignatedCoachByIdUseCase {
  const FindDesignatedCoachByIdUseCase(this._repository);
  final DesignatedCoachRepository _repository;

  Future<Result<DesignatedCoachDetails>> execute(int id) =>
      _repository.findById(id);
}