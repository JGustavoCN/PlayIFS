// Ficheiro: lib/data/models/campus/campus_summary_dto.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'campus_summary_dto.freezed.dart';
part 'campus_summary_dto.g.dart';

/// DTO para os dados resumidos de um Campus.
@freezed
abstract class CampusSummaryDTO with _$CampusSummaryDTO {
  /// Construtor factory para o DTO.
  const factory CampusSummaryDTO({
    required int id,
    required String name,
  }) = _CampusSummaryDTO;

  /// Construtor factory para desserialização a partir de um JSON.
  factory CampusSummaryDTO.fromJson(Map<String, dynamic> json) =>
      _$CampusSummaryDTOFromJson(json);
}