// Ficheiro: lib/domain/entities/campus/campus_summary.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'campus_summary.freezed.dart';

/// Representa os dados resumidos de um Campus.
@freezed
abstract class CampusSummary with _$CampusSummary {
  /// Construtor factory para criar uma instância imutável de CampusSummary.
  const factory CampusSummary({
    required int id,
    required String name,
  }) = _CampusSummary;
}