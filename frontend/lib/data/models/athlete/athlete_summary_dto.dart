import 'package:freezed_annotation/freezed_annotation.dart';

part 'athlete_summary_dto.freezed.dart';
part 'athlete_summary_dto.g.dart';

@freezed
abstract class AthleteSummaryDTO with _$AthleteSummaryDTO {
  const factory AthleteSummaryDTO({
    required int id,
    required String registration,
    required String fullName,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _AthleteSummaryDTO;

  factory AthleteSummaryDTO.fromJson(Map<String, dynamic> json) =>
      _$AthleteSummaryDTOFromJson(json);
}