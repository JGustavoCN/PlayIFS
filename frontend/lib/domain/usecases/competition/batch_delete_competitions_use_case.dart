import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/shared/id_batch.dart'; // 1. Importar a entidade
import 'package:playifs_frontend/domain/repositories/competition_repository.dart';

/// Use case for deleting multiple competitions in a batch.
class BatchDeleteCompetitionsUseCase {
  /// Default constructor
  const BatchDeleteCompetitionsUseCase(this._repository);

  final CompetitionRepository _repository;

  /// Executes the use case.
  Future<Result<void>> execute(List<int> ids) {
    // 2. Criar a entidade IdBatch a partir da lista de inteiros.
    final idBatch = IdBatch(ids: ids);
    // 3. Passar a entidade para o repositório.
    return _repository.batchDelete(idBatch);
  }
}