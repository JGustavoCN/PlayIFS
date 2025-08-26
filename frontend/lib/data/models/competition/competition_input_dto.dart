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
    // ADICIONADO: Lista de IDs de desportos (Long no Java -> int no Dart).
    required List<int> sportIds,
  }) = _CompetitionInputDTO;

  /// Construtor factory para serialização para JSON.
  factory CompetitionInputDTO.fromJson(Map<String, dynamic> json) =>
      _$CompetitionInputDTOFromJson(json);
}