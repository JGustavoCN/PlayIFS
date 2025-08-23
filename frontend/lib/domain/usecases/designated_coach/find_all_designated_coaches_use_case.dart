// Ficheiro: lib/domain/usecases/designated_coach/find_all_designated_coaches_use_case.dart
import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/designated_coach/designated_coach_summary.dart';
import 'package:playifs_frontend/domain/entities/shared/page.dart';
import 'package:playifs_frontend/domain/repositories/designated_coach_repository.dart';

class FindAllDesignatedCoachesUseCase {
  const FindAllDesignatedCoachesUseCase(this._repository);
  final DesignatedCoachRepository _repository;

  Future<Result<Page<DesignatedCoachSummary>>> execute({
    int page = 0,
    int size = 10,
    Map<String, dynamic>? filters,
  }) => _repository.findAll(page: page, size: size, filters: filters);
}