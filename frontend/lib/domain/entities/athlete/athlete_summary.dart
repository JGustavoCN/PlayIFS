// lib/domain/entities/athlete/athlete_summary.dart

import 'package:freezed_annotation/freezed_annotation.dart';

// Diretiva 'part' atualizada para o novo nome do ficheiro
part 'athlete_summary.freezed.dart';

@freezed
abstract class AthleteSummary with _$AthleteSummary {
  const factory AthleteSummary({
    required int id,
    required String registration,
    required String fullName,
  }) = _AthleteSummary;
}