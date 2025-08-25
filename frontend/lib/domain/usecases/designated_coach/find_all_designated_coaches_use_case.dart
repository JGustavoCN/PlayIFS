import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/designated_coach/designated_coach_summary.dart';
import 'package:playifs_frontend/domain/entities/shared/page.dart';
import 'package:playifs_frontend/domain/repositories/designated_coach_repository.dart';

class FindAllDesignatedCoachesUseCase {
  const FindAllDesignatedCoachesUseCase(this._repository);
  final DesignatedCoachRepository _repository;

  // ✅ CORRETO: Revertido para 'execute' para seguir o padrão do projeto.
  Future<Result<Page<DesignatedCoachSummary>>> execute({
    int page = 0,
    int size = 10,
    int? competitionId,
    int? sportId,
    int? courseId,
    String? athleteName,
  }) {
    final filters = <String, dynamic>{
      'competitionId': competitionId,
      'sportId': sportId,
      'courseId': courseId,
      'athleteName': athleteName,
    }..removeWhere((key, value) => value == null);

    return _repository.findAll(page: page, size: size, filters: filters);
  }
}