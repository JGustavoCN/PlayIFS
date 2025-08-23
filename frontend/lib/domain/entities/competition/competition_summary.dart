// Ficheiro: lib/domain/entities/competition/competition_summary.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'competition_summary.freezed.dart';

/// Representa os dados resumidos de uma Competição.
@freezed
abstract class CompetitionSummary with _$CompetitionSummary {
  /// Construtor para criar uma instância imutável de CompetitionSummary.
  const factory CompetitionSummary({
    required int id,
    required String name,
    required String level,
  }) = _CompetitionSummary;
}