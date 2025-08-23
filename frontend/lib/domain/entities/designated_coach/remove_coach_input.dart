// Ficheiro: lib/domain/entities/designated_coach/remove_coach_input.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'remove_coach_input.freezed.dart';

/// Representa os dados de entrada para remover uma designação de técnico.
@freezed
abstract class RemoveCoachInput with _$RemoveCoachInput {
  /// Construtor para criar uma instância imutável.
  const factory RemoveCoachInput({
    required int competitionId,
    required int sportId,
    required int courseId,
  }) = _RemoveCoachInput;
}