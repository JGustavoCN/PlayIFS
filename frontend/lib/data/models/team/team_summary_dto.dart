import 'package:freezed_annotation/freezed_annotation.dart';

part 'team_summary_dto.freezed.dart';
part 'team_summary_dto.g.dart';

@freezed
abstract class TeamSummaryDTO with _$TeamSummaryDTO {
  const factory TeamSummaryDTO({
    required int id,
    required String name,
    // ✅ CORREÇÃO: Removidos os campos 'sportName' e 'competitionName' que não existem na API de listagem.
  }) = _TeamSummaryDTO;

  factory TeamSummaryDTO.fromJson(Map<String, dynamic> json) =>
      _$TeamSummaryDTOFromJson(json);
}