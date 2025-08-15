// lib/domain/entities/athlete/athlete_update.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'athlete_update.freezed.dart';

@freezed
abstract class AthleteUpdate with _$AthleteUpdate {
  const factory AthleteUpdate({
    required String registration,
    required String fullName,
    String? nickname,
    String? phone,
    required String email,
  }) = _AthleteUpdate;
}