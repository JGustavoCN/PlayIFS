// Ficheiro: lib/data/models/competition/competition_input_dto.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'competition_input_dto.freezed.dart';
part 'competition_input_dto.g.dart';

/// DTO para os dados de entrada para criar/atualizar uma Competição.
@freezed
abstract class CompetitionInputDTO with _$CompetitionInputDTO {
  /// Construtor factory para o DTO.
  const factory CompetitionInputDTO({
    required String name,
    required String level,
  }) = _CompetitionInputDTO;

  /// Construtor factory para serialização para JSON.
  factory CompetitionInputDTO.fromJson(Map<String, dynamic> json) =>
      _$CompetitionInputDTOFromJson(json);
}