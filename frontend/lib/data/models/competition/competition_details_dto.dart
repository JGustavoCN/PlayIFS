// Ficheiro: lib/data/models/competition/competition_details_dto.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'competition_details_dto.freezed.dart';
part 'competition_details_dto.g.dart';

/// DTO para os dados detalhados de uma Competição.
@freezed
abstract class CompetitionDetailsDTO with _$CompetitionDetailsDTO {
  /// Construtor factory para o DTO.
  const factory CompetitionDetailsDTO({
    required int id,
    required String name,
    required String level,
  }) = _CompetitionDetailsDTO;

  /// Construtor factory para desserialização a partir de um JSON.
  factory CompetitionDetailsDTO.fromJson(Map<String, dynamic> json) =>
      _$CompetitionDetailsDTOFromJson(json);
}