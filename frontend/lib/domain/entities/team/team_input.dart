import 'package:freezed_annotation/freezed_annotation.dart';

part 'team_input.freezed.dart';

@freezed
abstract class TeamInput with _$TeamInput {
  const factory TeamInput({
    required String name,
    required int competitionId,
    required int sportId,
    required int courseId,
    required int coachId,
    required List<int> athleteIds,
  }) = _TeamInput;
}