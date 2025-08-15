// lib/data/models/athlete/athlete_input_dto.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'athlete_input_dto.freezed.dart';
part 'athlete_input_dto.g.dart';

@freezed
abstract class AthleteInputDTO with _$AthleteInputDTO {
  // A anotação @JsonSerializable foi movida para o construtor factory.
  const factory AthleteInputDTO({
    required String registration,
    required String fullName,
    String? nickname,
    String? phone,
    required String email,
    required String password,
  }) = _AthleteInputDTO;

  // ✅ CORREÇÃO: Adicionar este construtor factory.
  factory AthleteInputDTO.fromJson(Map<String, dynamic> json) =>
      _$AthleteInputDTOFromJson(json);
}