// Ficheiro: lib/domain/usecases/competition/find_all_competitions_use_case.dart
import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/competition/competition_summary.dart';
import 'package:playifs_frontend/domain/entities/shared/page.dart';
import 'package:playifs_frontend/domain/repositories/competition_repository.dart';

class FindAllCompetitionsUseCase {
  const FindAllCompetitionsUseCase(this._repository);
  final CompetitionRepository _repository;

  Future<Result<Page<CompetitionSummary>>> execute({
    int page = 0,
    int size = 10,
    String? sort,
    Map<String, dynamic>? filters,
  }) => _repository.findAll(page: page, size: size, sort: sort, filters: filters);
}