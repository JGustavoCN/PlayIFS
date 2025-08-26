import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/competition/competition_summary.dart';
import 'package:playifs_frontend/domain/entities/shared/page.dart';
import 'package:playifs_frontend/domain/repositories/competition_repository.dart';

/// Use case for finding all competitions.
class FindAllCompetitionsUseCase {
  /// Default constructor
  const FindAllCompetitionsUseCase(this._repository);

  final CompetitionRepository _repository;

  /// Executes the use case.
  Future<Result<Page<CompetitionSummary>>> execute({
    int page = 0,
    int size = 10,
    String? sort,
    String? name, // 1. Receber os filtros específicos
    String? level,
  }) => _repository.findAll( // 2. Passar os filtros específicos para o repositório
    page: page,
    size: size,
    sort: sort,
    name: name,
    level: level,
  );
}