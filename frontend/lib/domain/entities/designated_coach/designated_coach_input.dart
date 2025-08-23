// Ficheiro: lib/domain/entities/designated_coach/designated_coach_input.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'designated_coach_input.freezed.dart';

/// Representa os dados de entrada para designar um técnico.
@freezed
abstract class DesignatedCoachInput with _$DesignatedCoachInput {
  /// Construtor para criar uma instância imutável.
  const factory DesignatedCoachInput({
    required int competitionId,
    required int sportId,
    required int courseId,
    required int coachId,
  }) = _DesignatedCoachInput;
}