// Ficheiro: lib/domain/entities/designated_coach/designated_coach_summary.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'designated_coach_summary.freezed.dart';

/// Representa os dados resumidos de uma designação de técnico.
@freezed
abstract class DesignatedCoachSummary with _$DesignatedCoachSummary {
  /// Construtor para criar uma instância imutável.
  const factory DesignatedCoachSummary({
    required int id,
    required String competitionName,
    required String sportName,
    required String courseName,
    required String athleteName,
  }) = _DesignatedCoachSummary;
}