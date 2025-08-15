// lib/domain/entities/athlete/athlete_input.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'athlete_input.freezed.dart';

@freezed
abstract class AthleteInput with _$AthleteInput {
  const factory AthleteInput({
    required String registration,
    required String fullName,
    String? nickname,
    String? phone,
    required String email,
    required String password,
  }) = _AthleteInput;
}