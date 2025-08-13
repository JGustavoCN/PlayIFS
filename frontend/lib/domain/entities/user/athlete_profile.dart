import 'package:freezed_annotation/freezed_annotation.dart';
part 'athlete_profile.freezed.dart';

@freezed
abstract class AthleteProfile with _$AthleteProfile {
  const factory AthleteProfile({
    required int id,
    required String registration,
    required String fullName,
    required String nickname,
    required String phone,
    required String email,
    required bool isCoach,
  }) = _AthleteProfile;
}