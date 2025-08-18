// Ficheiro: lib/data/models/sport/sport_summary_dto.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'sport_summary_dto.freezed.dart';
part 'sport_summary_dto.g.dart';

/// DTO para os dados resumidos de um Desporto.
@freezed
abstract class SportSummaryDTO with _$SportSummaryDTO {
  /// Construtor factory para o DTO.
  const factory SportSummaryDTO({
    required int id,
    required String name,
    // Ignoramos createdAt e updatedAt pois não são usados no domínio.
  }) = _SportSummaryDTO;

  /// Construtor factory para desserialização a partir de um JSON.
  factory SportSummaryDTO.fromJson(Map<String, dynamic> json) =>
      _$SportSummaryDTOFromJson(json);
}