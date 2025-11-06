import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_update_input.freezed.dart';

@freezed
abstract class GameUpdateInput with _$GameUpdateInput {
  const factory GameUpdateInput({
    required DateTime dateTime,
  }) = _GameUpdateInput;
}