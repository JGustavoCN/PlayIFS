// Ficheiro: lib/domain/entities/designated_coach/designated_coach_input_batch.dart

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playifs_frontend/domain/entities/designated_coach/designated_coach_input.dart';

part 'designated_coach_input_batch.freezed.dart';

/// Representa um lote de designações de técnicos para operações em massa.
@freezed
abstract class DesignatedCoachInputBatch with _$DesignatedCoachInputBatch {
  /// Construtor para criar uma instância imutável.
  const factory DesignatedCoachInputBatch({
    required List<DesignatedCoachInput> designations,
  }) = _DesignatedCoachInputBatch;
}