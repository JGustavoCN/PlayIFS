import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playifs_frontend/data/models/sport/sport_summary_dto.dart';

part 'competition_details_dto.freezed.dart';
part 'competition_details_dto.g.dart';

/// DTO para os dados detalhados de uma Competição, alinhado com a API.
@freezed
abstract class CompetitionDetailsDTO with _$CompetitionDetailsDTO {
  /// Construtor factory para o DTO.
  const factory CompetitionDetailsDTO({
    required int id,
    required String name,
    required String level,
    // CORREÇÃO: O status pode vir nulo da API.
    required String? status,
    required List<SportSummaryDTO> associatedSports,
  }) = _CompetitionDetailsDTO;

  /// Construtor factory para desserialização a partir de um JSON.
  factory CompetitionDetailsDTO.fromJson(Map<String, dynamic> json) =>
      _$CompetitionDetailsDTOFromJson(json);
}