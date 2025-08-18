// Ficheiro: lib/domain/entities/sport/sport_summary.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'sport_summary.freezed.dart';

/// Representa os dados resumidos de um Desporto.
///
/// Contém as informações essenciais para exibição em listas.
@freezed
abstract class SportSummary with _$SportSummary {
  /// Construtor factory para criar uma instância imutável de SportSummary.
  const factory SportSummary({
    required int id,
    required String name,
  }) = _SportSummary;
}