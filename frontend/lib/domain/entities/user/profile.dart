import 'package:freezed_annotation/freezed_annotation.dart';
import 'athlete_profile.dart';
import 'coordinator_profile.dart';

part 'profile.freezed.dart';

@freezed
abstract class Profile with _$Profile {
  const factory Profile({
    required int userId,
    required String registration,
    required List<String> roles,
    // Perfis específicos são nuláveis, refletindo a lógica do backend
    AthleteProfile? athleteProfile,
    CoordinatorProfile? coordinatorProfile,
  }) = _Profile;
}