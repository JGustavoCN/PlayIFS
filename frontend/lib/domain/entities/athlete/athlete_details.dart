// Ficheiro: lib/domain/entities/athlete/athlete_details.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'athlete_details.freezed.dart';

@freezed
abstract class AthleteDetails with _$AthleteDetails {
  const factory AthleteDetails({
    required int id,
    required String registration,
    required String fullName,
    String? nickname, // Nulável para maior flexibilidade
    String? phone,    // Nulável para maior flexibilidade
    required String email,
    required bool isCoach,
  }) = _AthleteDetails;
}