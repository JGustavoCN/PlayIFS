import 'package:freezed_annotation/freezed_annotation.dart';
import '../athlete/athlete_details.dart';
import 'coordinator_profile.dart';

part 'profile.freezed.dart';

@freezed
abstract class Profile with _$Profile {
  const factory Profile({
    required int userId,
    required String registration,
    required List<String> roles,
    AthleteDetails? athleteDetails,
    CoordinatorProfile? coordinatorProfile,
  }) = _Profile;
}