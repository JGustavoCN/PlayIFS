// lib/domain/repositories/athlete_repository.dart

import 'package:playifs_frontend/core/network/result.dart';
import 'package:playifs_frontend/domain/entities/shared/page.dart';
import '../entities/athlete/athlete_details.dart';
import '../entities/athlete/athlete_input.dart';
import '../entities/athlete/athlete_summary.dart';
import '../entities/athlete/athlete_update.dart';

abstract class AthleteRepository {
  /// Lista todos os atletas de forma paginada.
  Future<Result<Page<AthleteSummary>>> findAll({
    int page = 0,
    int size = 10,
    String? name,
  });

  /// Busca um atleta por ID.
  Future<Result<AthleteDetails>> findById(int id);

  /// Cadastra um novo atleta.
  Future<Result<AthleteDetails>> insert(AthleteInput athleteInput);

  /// Cadastra novos atletas em massa.
  Future<Result<List<AthleteDetails>>> batchInsert(List<AthleteInput> athletes);

  /// Atualiza os dados de um atleta.
  Future<Result<AthleteDetails>> update(int id, AthleteUpdate athleteUpdate);

  /// Apaga um atleta.
  Future<Result<void>> delete(int id);

  /// Apaga atletas em massa.
  Future<Result<void>> batchDelete(List<int> ids);
}