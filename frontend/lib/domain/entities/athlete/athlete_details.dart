import 'package:freezed_annotation/freezed_annotation.dart';

part 'athlete_details.freezed.dart';

@freezed
abstract class AthleteDetails with _$AthleteDetails {
  const factory AthleteDetails({
    required int id,
    required String registration,
    required String fullName,
    String? nickname,
    String? phone,
    required String email,
    required bool isCoach,
  }) = _AthleteDetails;
}