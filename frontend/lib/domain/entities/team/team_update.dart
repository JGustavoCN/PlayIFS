// lib/domain/entities/team/team_update.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'team_update.freezed.dart';

@freezed
abstract class TeamUpdate with _$TeamUpdate {
  /// Represents the data required to update an existing team's name.
  const factory TeamUpdate({
    required String name,
  }) = _TeamUpdate;
}