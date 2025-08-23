// Ficheiro: lib/data/models/competition/competition_summary_dto.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'competition_summary_dto.freezed.dart';
part 'competition_summary_dto.g.dart';

/// DTO para os dados resumidos de uma Competição.
@freezed
abstract class CompetitionSummaryDTO with _$CompetitionSummaryDTO {
  /// Construtor factory para o DTO.
  const factory CompetitionSummaryDTO({
    required int id,
    required String name,
    required String level,
  }) = _CompetitionSummaryDTO;

  /// Construtor factory para desserialização a partir de um JSON.
  factory CompetitionSummaryDTO.fromJson(Map<String, dynamic> json) =>
      _$CompetitionSummaryDTOFromJson(json);
}