import 'package:freezed_annotation/freezed_annotation.dart';
part 'coordinator_profile.freezed.dart';

@freezed
abstract class CoordinatorProfile with _$CoordinatorProfile {
  const factory CoordinatorProfile({
    required int id,
    required String registration,
    required String name,
    required String email,
  }) = _CoordinatorProfile;
}