// lib/data/models/athlete/athlete_update_dto.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'athlete_update_dto.freezed.dart';
part 'athlete_update_dto.g.dart';

@freezed
abstract class AthleteUpdateDTO with _$AthleteUpdateDTO {
  const factory AthleteUpdateDTO({
    required String registration,
    required String fullName,
    String? nickname,
    String? phone,
    required String email,
  }) = _AthleteUpdateDTO;

  // ✅ CORREÇÃO: Adicionar este construtor factory.
  factory AthleteUpdateDTO.fromJson(Map<String, dynamic> json) =>
      _$AthleteUpdateDTOFromJson(json);
}